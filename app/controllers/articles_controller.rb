class ArticlesController < ApplicationController
  def index
     @articulo = Article.all
  end
  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
        redirect_to @article
    else
        render 'new'
    end

  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article= Article.find(params[:id])
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    #redirect_to :action => :index
  end
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
  end
end
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
  end
