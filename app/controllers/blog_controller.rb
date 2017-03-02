class BlogController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    #@blogs=Blog.all
    @blogs=Tag.find_by_name("blog").posts
  end

  def show

  end

  def new
    #@blog = Blog.new
    @blog = Post.new
  end

  def create
    # @blog=Blog.new(blog_params)
    @blog=Post.new(blog_params)
    @blog.save
    Tagging.create(post_id: @blog.id, tag_id: 1)
    redirect_to set_url(:show, @blog.id)
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    redirect_to set_url(:show, @blog.id)
  end

  def destroy
    @blog.destroy
    redirect_to url_for(controller: :blog, action: :index)
  end

  private
  def set_blog
    #@blog=Blog.find(params[:id])
    @blog=Tag.find_by_name("blog").posts.find(params[:id])
  end

  def set_url(action, id)
    url_for(controller: :blog, action: action, id: id)
  end

  def blog_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end
