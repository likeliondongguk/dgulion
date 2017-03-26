class Studyinfo < ActiveRecord::Base
  belongs_to :user

  def self.users(wday)
    ary = []
    self.where(wday: wday).each do |s_info|
      ary << s_info.user
    end
    return ary
  end
end
