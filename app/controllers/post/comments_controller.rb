class Post::CommentsController < CommentsController
  before_action :set_commentable

  private
  def set_commentable
    @commentable = Post.find(params[:post_id])
    @url= :post
    @category = Category.find(params[:category_id])
  end
end