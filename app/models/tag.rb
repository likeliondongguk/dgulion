class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :posts, through: :taggings
  validates :name, uniqueness: {case_sensitive: false}
  before_save{self.name.downcase!}
  # 단일 태그 찾아주는 메소드
  def self.get_post(name)
    return Tag.find_by_name(name).posts
  end

  def self.is_name_exist?(name)
    return true unless self.find_by_name(name.downcase).nil?
    false
  end

end
