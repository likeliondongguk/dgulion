class Submission::CommentsController < CommentsController
  before_action :set_commentable

  private
  def set_commentable
    @commentable = Submission.find(params[:submission_id])
    @url= :submission
    @task = Task.find(params[:task_id])
  end
end