class Post < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  validates :user_id, presence: true
  #작성자 확인 메소드
  def is_writer?(u)
    return true if !u.nil? && u == self.user
    false
  end
end
