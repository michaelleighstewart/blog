class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = @user.articles.new(article_params)
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
