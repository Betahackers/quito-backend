module V2
  class ArticlesController < BaseController
    load_and_authorize_resource

    before_action :authorize_json_only, except: :show

    def index
      @articles = Article.all
      @articles = @articles.where(user_id: params[:user_id] ) if params[:user_id]
      @articles = @articles.tagged_with(params[:mood], on: :moods) if params[:mood]
      @articles = @articles.tagged_with(params[:category], on: :categories) if params[:category]
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