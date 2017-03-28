class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  def self.get_posts(name)
    self.find_by_name(name).posts
  end

  def get_icon
    case self.name
      when 'blog' then
        'et-layers'
      when 'board' then
        'et-heart'
      when 'anony' then
        'et-heart'
      when 'questions' then
        'fa fa-question'
    end
  end

  def get_active(category)
    return category==self ? "active" : ""
  end

  def self.get_default
    return self.find_by_name("all")
  end

  def self.all_posts
    all_ary = []
    Category.all.each do |category|
      if category.level==2
        all_ary << category.id
      end
      return Post.where(category_id: all_ary)
    end
  end

  def all_posts
    all_ary = []
    Category.all.each do |category|
      if category.level==2
        all_ary << category.id
      end
    end
    if self.name=="all"
      return Post.where(category_id: all_ary)
    else
      return self.posts
    end
  end
end
