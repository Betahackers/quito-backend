module V1
  class ArticlesController < ApplicationController
    load_and_authorize_resource
  
    def index
      @articles = Article.all
      @articles = @articles.where(user_id: params[:author_id] ) if params[:author_id]
      @articles = @articles.tagged_with(params[:moods], on: :moods) if params[:moods]
      @articles = @articles.tagged_with(params[:category], on: :categories) if params[:category]
      @articles
    end

    def show
    end

    def new
    end
  
    def create    
      respond_to do |format|
        # locations = 
        # @article.locations = locations
        if @article.save
          format.html {redirect_to @article, notice: 'Success'}
          format.json { render json: @article }
        else
          format.html {render :new, alert: 'failed :('}
          format.json
        end
      end
    end
  
    def edit
    end
  
    def update
      respond_to do |format|
        if @article.update_attributes(article_params)
          format.html {redirect_to @article, notice: 'Success'}
          format.json { render json: @article }
        else
          format.html {render :new, alert: 'failed :('}
          format.json
        end
      end
    end
  
    def destroy
      @article.destroy
      respond_to do |format|
        format.html {redirect_to articles_path, notice: 'Success'}
        format.json 
      end
    end
  
    private
  
    def article_params
      params.require(:article).permit(:title, :content, :foursquare_ids, mood_list:[], category_list:[])
    end

  end
end