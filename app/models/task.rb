class Task < ActiveRecord::Base
  has_many :t_rates, dependent: :destroy
  has_many :users, through: :t_rates
  validates :title, presence: true


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

  def fifth_rate
    ary = []
    User.where(admin: false).each do |user|
      ary << user.id
    end
    bottom= TRate.where(user_id: ary, task_id: self.id).count
    top=0
    TRate.where(user_id: ary, task_id: self.id).each do |trate|
      if trate.status
        top +=1
      end
    end
    return top.fdiv(bottom).nan? ? 0 : top.fdiv(bottom)
  end
end
