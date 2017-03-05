class Board < ActiveRecord::Base
  #Board model need to be changed to Post

  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments, as: :commentable
  validates :user_id, presence: true

  #작성자 확인 메소드
  def is_writer?(u)
    return true if !u.nil? && u == self.user
    false
  end

  # 1 레벨의 tag(게시판 이름)걸기
  def tag_save(tagName)
    self.save
    Tagging.create(board_id: self.id, tag_id: Tag.find_by_name(tagName).id)
  end
end