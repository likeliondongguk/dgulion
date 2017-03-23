class TasksController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index

    if params[:search]
      @tasks = Task.search(params[:search]).order("created_at DESC")
    else
      @tasks = Task.all.order('created_at DESC')
    end

    @tasks = Task.paginate(:page => params[:page], :per_page => 8)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task=Task.new(task_params)
    @task.t_save
    redirect_to url_for(controller: :tasks, action: :index, id: @task.id)
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.update(task_params)
    redirect_to @task
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    redirect_to @task
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :content, :image)
    end
end
