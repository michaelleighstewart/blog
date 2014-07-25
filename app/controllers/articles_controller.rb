class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @article = @user.articles.create(article_params)
    render "new"
  end

  def article_params
    params.require(:article).permit(:user_id, :title, :body)
  end

  def show
    @article = Article.find(params[:id])
  end
end
