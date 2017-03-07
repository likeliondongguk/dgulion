class Task < ActiveRecord::Base
  has_many :t_rates
  has_many :users, through: :t_rates


  def is_writer?(u)
    return true if !u.nil? && u == self.user
    false
  end

  def self.search(search)
    where("content || title LIKE ?", "%#{search}%")
  end
end
