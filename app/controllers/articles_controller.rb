class ArticlesController < ApplicationController
def index
   @articulo = Article.all
end
  def new

  end

  def create
    #render plain: params[:article].inspect
    @articulo = Article.new(article_params)
    @articulo.save
    redirect_to @articulo
  end
  def show
    @articulo = Article.find(params[:id])
  end
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
