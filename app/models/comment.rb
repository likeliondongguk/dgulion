class Comment < ActiveRecord::Base
  belongs_to :user, dependent: :delete
  belongs_to :commentable, polymorphic: true, dependent: :delete
  validates :user_id, presence: true
end
