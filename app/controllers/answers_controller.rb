class AnswersController < ApplicationController
  before_action :user?
  def create
    @answer=Category.get_posts("questions").find(params[:question_id]).answers.new(answer_params)
    @answer.user=current_user
    @answer.save
    redirect_to :back
  end
  def destroy
    @answer=Answer.find(params[:id])
    @answer.destroy
    redirect_to :back, notice: "성공적으로 삭제되었습니다."
  end

  def select
    @answer=Answer.find(params[:id])
    redirect_to :back, notice: @answer.check_save(current_user)
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end

  def user?
    if !user_signed_in?
      redirect_to root_path, notice: '로그인하고 사용하세요'
    end
  end
end
