class BlogController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy ]
  def index
     @blogs=Blog.all
    # @blogs=Tag.find_by(name: "blog").posts
  end
  def show

  end
  def new
     @blog = Blog.new
    #@blog = Post.new
  end
  def create
    @blog=Blog.new(blog_params)
    # @blog=Post.new(blog_params)
    @blog.save
    redirect_to @blog
  end
  def edit
  end
  def update
    @blog.update(blog_params)
    redirect_to @blog
  end
  def destroy
    @blog.destroy
    redirect_to @blog
  end

  private
  def set_blog
    @blog=Blog.find(params[:id])
  end
  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end

end
