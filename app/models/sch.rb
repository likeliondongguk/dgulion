class Sch < ActiveRecord::Base
  has_many :atts, dependent: :destroy
  has_many :users, through: :atts

  def att_save
    if self.save
      if self.form==true
        Studyinfo.users(self.date.wday).each do |user|
          Att.create(user_id: user.id, sch_id: self.id, status: false)
        end
      end
    else
    end
  end

  def start_time
    self.date
  end

  def self.month_ary
    ary = []
    self.all.each do |sch|
      ary << sch.date.month
    end
    ary=ary.uniq
    return ary
  end

  def self.month_result(month)
    ary = []
    self.all.each do |sch|
      if sch.date.month == month
        ary << sch
      end
    end
    return ary
  end

  def att_status(status)
    return self.atts.where(status: status)
  end
end
