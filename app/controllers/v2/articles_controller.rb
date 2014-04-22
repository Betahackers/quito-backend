module V2
  class ArticlesController < BaseController    
    load_and_authorize_resource

    before_action :authorize_json_only, except: :show

    has_scope :by_mood, type: :array
    has_scope :by_category, type: :array
    has_scope :by_user, type: :array
    has_scope :by_lat_long, using: [:lat, :long, :radius], type: :hash
    has_scope :by_location, type: :array
    
    def index
      @articles = apply_scopes(@articles).includes(:locations, :user)  
      @articles = @articles.where(user_id: current_user.id) if current_user && !params[:all_articles]  && request.format != :json      
      # Dont paginate for now. send everything
      # @articles = @articles.paginate(page: params[:page], per_page: 100)
    end

    def show
    end

    def new
      @article.article_locations.new
    end

    def create
      @article.user = current_user
      respond_to do |format|
        if @article.save
          flash[:notice] = "Article added!! Add another? (or #{ActionController::Base.helpers.link_to('<b>go back</b>'.html_safe, articles_path)})"
          format.html { redirect_to new_article_path}
          format.json { render json: @article }
        else
          format.html { render :new, alert: 'failed :(' }
          format.json
        end
      end
    end

    def edit
      @article.article_locations.first_or_initialize
    end

    def update
      respond_to do |format|
        if @article.update_attributes(article_params)
          format.html { redirect_to articles_path, notice: 'Article updated' }
          format.json { render json: @article }
        else
          format.html { render :new, alert: 'failed :(' }
          format.json
        end
      end
    end

    def destroy
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_path, notice: 'Article deleted' }
        format.json
      end
    end

    private

    def authorize_json_only
      if request.format != :json
        authorize! :manage, Article, :message => "Unable to view articles"
      end
    end


    def article_params
      params.require(:article).permit(:title, :content, :foursquare_ids, article_locations_attributes: [:id, :foursquare_id], mood_list:[], category_list:[])
    end

  end
end