class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #sungjun_working on task/t_rate/user 's relation part
  has_many :t_rates
  has_many :tasks, through: :t_rates

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :answers, dependent: :destroy

  has_many :atts, dependent: :destroy
  has_many :sches, through: :atts

  has_many :studyinfos
  validates :username, presence: true

  # User Avatar Validation
  validates_integrity_of :avatar
  validates_processing_of :avatar

  def complete_profile
    result= 0
    score = 25
    column= [self.username, self.description, self.phone_number, self.avatar.url]
    column.each do |col|
      if !col.nil? && col!=""
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

  def nickname
    name=""
    if self.admin
      name="동국대 멋쟁이 사자처럼 5기 운영진"
    else
      name="동국대 멋쟁이 사자처럼 5기"
    end
    return name
  end

  private
  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end
end