class BlogController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    #@blogs=Tag.get_post("blog")

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
    @blog.save
    #@blog.tag_save("blog")
    redirect_to url_for(controller: :blog, action: :show, id: @blog.id)
  end
  def edit
  end
  def update
    @blog.update(blog_params)
    redirect_to url_for(controller: :blog, action: :show, id: @blog.id)
  end
  def destroy
    @blog.destroy
    redirect_to url_for(controller: :blog, action: :index)
  end

  private
  def set_blog
    #@blog=Tag.get_post("blog").find(params[:id])
    @blog=Category.get_posts("blog").find(params[:id])
  end

  def blog_params
    params.require(:post).permit(:title, :content)
  end

  # 만들어봤는데 무쓸모
  # def set_url(action, id)
  #   url_for(controller: :blog, action: action, id: id)
  # end
end
