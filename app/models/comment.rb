class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates :user_id, presence: true

  def post
    self.commentable
  end
end
