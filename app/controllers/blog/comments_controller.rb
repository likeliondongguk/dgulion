class Blog::CommentsController < CommentsController
  before_action :set_commentable

  private
  def set_commentable
    @commentable = Category.get_posts("blog").find(params[:blog_id])
    @url= :blog
  end
end