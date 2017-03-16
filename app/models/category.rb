class Category < ActiveRecord::Base
  has_many :posts

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
end
