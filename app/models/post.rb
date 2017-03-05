class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
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
    Tagging.create(post_id: self.id, tag_id: Tag.find_by_name(tagName).id)
  end

  # 이미지만 뽑아내기
  def get_first_thumb
    if self.content.slice(/h([^<]+)(png|jpg|psd|gif|jpeg)/).nil?
      return "https://placehold.it/600x399"
    else
      self.content.slice(/h([^<]+)(png|jpg|psd|gif|jpeg)/)
    end
  end


end
