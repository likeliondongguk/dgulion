class CommentsController < ApplicationController
  #before_action :authenticate_user!
  #ajax create destroy
  before_action :user?
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.js
      end
    else

    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def user?
    if !user_signed_in?
      redirect_to root_path, notice: '로그인하고 사용하세요'
    end
  end
end
