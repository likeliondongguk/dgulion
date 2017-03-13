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

  def tag_color
    color_array = %w(label-default label-primary label-success label-info label-warning label-danger label-blue label-sea label-yellow label-purple label-aqua label-brown label-dark-blue label-light-green label-light label-dark)
    if color_array.size >= self.id
      return color_array[self.id]
    else
      return color_array[color_array%16]
    end
  end

  def self.get_posts(tag_id, category_name)
    return Tag.find(tag_id).posts.where(category: Category.find_by_name(category_name))
  end

end
