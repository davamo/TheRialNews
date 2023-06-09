class CommentsController < ApplicationController
  before_action :set_article
  before_action :require_login

  def show
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @article, notice: 'Comment was successfully created.'
    else
      render 'articles/show'
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      redirect_to @article, notice: 'Comment was successfully destroyed.'
    else
      redirect_to @article, alert: 'You are not authorized to delete this comment.'
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: 'You must be logged in to perform this action.'
    end
  end
end
