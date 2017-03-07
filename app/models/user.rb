class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #sungjun_working on task/t_rate/user 's relation part
  has_many :t_rates
  has_many :tasks, through: :t_rates

  validates :username, presence: true

end
