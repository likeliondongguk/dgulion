class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_category
  before_action :user?
  # GET /posts
  # GET /posts.json
  def index
    @posts = @category.all_posts.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.category=@category
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to url_for(controller: :posts, action: :show, category_id: @post.category.id, id: @post.id), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, notice: @post.errors}
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to url_for(controller: :posts, action: :show, category_id: @post.category.id, id: @post.id), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to url_for(controller: :posts, action: :index, category_id: Category.find_by_name("board").id), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post =Post.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def user?
    if !user_signed_in?
      redirect_to root_path, notice: '로그인하고 사용하세요'
    end
  end
end
