class Task < ActiveRecord::Base
  has_many :t_rates
  has_many :users, through: :t_rates


  def is_completed?(c)
    return true if !c.nil && c == self.user
  end


  def self.search(search)
    where("content || title LIKE ?", "%#{search}%")
  end
end
