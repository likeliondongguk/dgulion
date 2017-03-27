class Att < ActiveRecord::Base
  belongs_to :sch
  belongs_to :user

  def self.rate(user)
    bottom=self.where(user_id: user.id).count
    top=0
    self.where(user_id: user.id).each do |att|
      if att.status
        top+=1
      end
    end
    return top.fdiv(bottom).nan? ? 0 : top.fdiv(bottom)
  end
end
