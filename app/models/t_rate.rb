class TRate < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  has_one :submission, dependent: :destroy

  def self.other_ids(task_id)
    ary = []
    self.where(task_id: task_id, status: true).each do |trate|
      ary << trate.id
    end
    return ary
  end

  def self.rate(user)
    bottom=TRate.where(user_id: user.id).count
    top=0
    TRate.where(user_id: user.id).each do |trate|
      if trate.status
        top+=1
      end
    end
    return top.fdiv(bottom).nan? ? 0 : top.fdiv(bottom)
  end
end
