class Blog::CommentsController < CommentsController
  before_action :set_commentable

  private
  def set_commentable
    @commentable = Tag.get_post("blog").find(params[:blog_id])
  end
end