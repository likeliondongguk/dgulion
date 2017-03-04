class Category < ActiveRecord::Base
  has_many :posts

  def self.get_posts(name)
    self.find_by_name(name).posts
  end
end
