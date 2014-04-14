module V2
  class ArticlesController < BaseController
    load_and_authorize_resource

    before_action :authorize_json_only, except: :show

    has_scope :by_mood
    has_scope :by_category
    has_scope :by_user
    has_scope :by_lat_long, using: [:lat, :long, :radius], type: :hash
    has_scope :by_location
    
    def index
      @articles = apply_scopes(@articles).includes(:locations, :user)   
      @articles = @articles.where(user_id: current_user.id) if current_user && !params[:all_articles]  && request.format != :json      
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
          format.html { redirect_to articles_path, notice: 'Article added' }
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