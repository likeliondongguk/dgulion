class Submission < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  belongs_to :task
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(search)
    where("content || title LIKE ?", "%#{search}%")
  end

  def is_writer?(u)
    return true if !u.nil? && u == self.user
    false
  end

  def t_save(user)
    if self.save
      t_rate=self.task.t_rates.find_by(user_id: user.id)
      t_rate.status = true
      t_rate.save
    end
  end


 end
