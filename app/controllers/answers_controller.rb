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
    if @answer.post.user==current_user
      @answer.check = @answer.check==false ? true : false
      @answer.save
      redirect_to :back, notice: '선정되었습니다!'
    else
      redirect_to :back, notice: '이 글의 작성자만 채택할 수 있습니다!'
    end


  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end
end
