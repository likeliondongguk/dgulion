class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs=Category.get_posts("blog")
  end

  def show
  end

  def new
    @blog = Post.new
  end

  def create
    @blog=Post.new(blog_params)
    @blog.category=Category.find_by_name("blog")
    @blog.user = current_user
    respond_to do |format|
      if @blog.save
        format.html { redirect_to url_for(controller: :blogs, action: :show, id: @blog.id), notice: "성공적으로 글이 작성되었습니다." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html {redirect_to url_for(controller: :blogs, action: :show, id: @blog.id), notice: "성공적으로 글이 업데이트되었습니다." }
        format.json {render :show, status: :ok, location: @blog}
      else
        format.html {render :edit}
        format.json {render json: @blog.errors, status: :unprocessable_entity}
      end

    end


  end

  def destroy
    @blog.destroy
    redirect_to url_for(controller: :blogs, action: :index)
  end

  private
  def set_blog
    @blog=Category.get_posts("blog").find(params[:id])
  end

  def blog_params
    params.require(:post).permit(:title, :content)
  end

end
