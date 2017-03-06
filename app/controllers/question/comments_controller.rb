class Question::CommentsController < CommentsController
  before_action :set_commentable

  private
  def set_commentable
    @commentable = Category.get_posts("question").find(params[:question_id])
    @url= :question
  end
end