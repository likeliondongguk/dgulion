class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :answers
  validates :username, presence: true

  def complete_profile
    result=0
    score = 25
    column= [self.username, self.description, self.phone_number, self.image]
    column.each do |col|
      unless col.nil?
        result+=score
      end
    end
    return result
  end

  def check_count
    result = 0
    self.answers.each do |answer|
      if answer.check==true
        result+=1
      end
    end
    return result
  end
end
