class Task < ActiveRecord::Bases
  has_many :t_rates
  has_many :users, through: :t_rates
end
