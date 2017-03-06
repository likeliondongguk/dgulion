class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :posts, through: :taggings

  # 단일 태그 찾아주는 메소드
  def self.get_post(name)
    return Tag.find_by_name(name).posts
  end
end
