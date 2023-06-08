class ArticlesController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_admin, only: [:new, :create]

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.find(params[:id])
    @comments = @comment.article.comments
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private


  def check_admin
    unless current_user.admin?
      flash[:alert] = "Solo los administradores pueden crear nuevos artículos."
      redirect_to root_path
    end
  end


  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: 'You must be logged in to perform this action.'
    end
  end
end
