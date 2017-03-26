class Task < ActiveRecord::Base
  has_many :t_rates
  has_many :users, through: :t_rates
  has_many :submissions
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  def is_writer?(u)
    return true if !u.nil? && u == self.user
    false
  end

  def is_completed?(c)
    return true if !c.nil && c == self.user
  end

  def t_save
    if self.save
      User.all.each do |user|
        TRate.create(user_id: user.id, task_id: self.id, status: false)
      end
    end
  end

  def self.search(search)
    where("content || title LIKE ?", "%#{search}%")
  end

  def is_submitted?(user)
    TRate.where(task_id: self.id).each do |t|
      if t.user_id==user.id
        return self.t_rates.find_by(user_id: user.id).status
      end
    end
   return false
  end

end
