class AnswersController < ApplicationController
  def create
    @answer=Category.get_posts("questions").find(params[:question_id]).answers.new(answer_params)
    @answer.user=current_user
    @answer.save
    redirect_to :back
  end
  def destroy

  end

  def select
    @answer=Answer.find(params[:id])
    redirect_to :back, notice: @answer.check_save(current_user)
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end
end
