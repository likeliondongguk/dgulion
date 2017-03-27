class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_task, except: [:other]
  before_action :user?
  # GET /submissions
  # GET /submissions.json
  def index
    #how to show submisstions that are belonged to task/1 task/2 task/3 ...
    # if params[:search]
    #   @submissions = Submission.search(params[:search]).order("created_at DESC")
    # else
    #   @submissions = Submission.all.order('created_at DESC')
    # end

    @submissionsL = Submission.paginate(:page => params[:page], :per_page => 8)

  end

  def other
    sub_id= params[:id]
    task_id= Submission.find(sub_id).t_rate.task_id
    # if params[:search]
    #   @submissions = Submission.where(task_id: task_id).search(params[:search]).order("created_at DESC")
    # else
    #   @submissions = Submission.where(task_id: task_id).order('created_at DESC')
    # end

    @submissions = Submission.other(task_id).paginate(:page => params[:page], :per_page => 8)
    render 'submissions/index'
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission=Submission.new(submission_params)
    @submission.t_rate=TRate.find_by(task_id: params[:task_id], user_id: current_user.id)
    file= params[:image]
    uploader = TaskUploader.new
    uploader.store!(file)
    @submission.image=uploader.url
    @submission.t_save(current_user)
    redirect_to url_for(controller: :submissions, action: :show, id: @submission.id, task_id: @submission.t_rate.task_id)
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    file= params[:image]
    uploader = TaskUploader.new
    uploader.store!(file)
    @submission.image=uploader.url
    @submission.update(submission_params)
    redirect_to url_for(controller: :submissions, action: :show, id: @submission.id, task_id: @submission.t_rate.task_id)
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    redirect_to url_for(controller: :submissions, action: :index, task_id: @submission.task_id)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_submission
    @submission = Submission.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def submission_params
    params.require(:submission).permit(:c9, :github, :content)
  end

  def user?
    if !user_signed_in?
      redirect_to root_path, notice: '로그인하고 사용하세요'
    end
  end
end
