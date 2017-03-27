class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :user?
  # GET /questions
  # GET /questions.json
  def index
    @questions =Category.get_posts("questions").order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Post.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Post.new(question_params)
    @question.user = current_user
    @question.category=Category.find_by_name("questions")
    if tag_params=={}
      respond_to do |format|
        if @question.save
          format.html { redirect_to url_for(controller: :questions, action: :show, id: @question.id), notice: 'Question was successfully created.' }
          format.json { render :show, status: :created, location: @question }
        else
          format.html { render :new }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @question.tag_save(tag_params[:tag])
          format.html { redirect_to url_for(controller: :questions, action: :show, id: @question.id), notice: 'Question was successfully created.' }
          format.json { render :show, status: :created, location: @question }
        else
          format.html { render :new }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if tag_params=={}
      respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to url_for(controller: :questions, action: :show, id: @question.id), notice: 'Question was successfully updated.' }
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { render :edit }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @question.update(question_params)
          @question.tag_update(tag_params[:tag])
          format.html { redirect_to url_for(controller: :questions, action: :show, id: @question.id), notice: 'Question was successfully updated.' }
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { render :edit }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.answers.each do |answer|
      answer.destroy
    end
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Category.get_posts("questions").find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:post).permit(:title, :content)
  end

  def tag_params
    params.require(:post).permit(tag: [])
  end

  def user?
    if !user_signed_in?
      redirect_to root_path, notice: '로그인하고 사용하세요'
    end
  end
end
