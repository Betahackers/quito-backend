module V1
  class ArticlesController < ApplicationController
    load_and_authorize_resource
  
    def index
      @articles = Article.all
      @articles = @articles.where(user_id: params[:author_id] ) if params[:author_id]
      @articles
    end

    def show
      @article = Article.find(params[:id])
    end

    def new
    end
  
    def create    
      respond_to do |format|
        if @article.save
          format.html
          format.json { render json: @article }
        else
          format.html
          format.json
        end
      end
    end
  
    def edit
    end
  
    def update
      respond_to do |format|
        if @article.update_attribtues(article_params)
          format.html
          format.json { render json: @article }
        else
          format.html
          format.json
        end
      end
    end
  
    def destroy
    end
  
    private
  
    def article_params
      params.require(:article).permit(:title, :content)
    end

  end
end