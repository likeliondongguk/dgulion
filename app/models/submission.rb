class Submission < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :t_rate

  validates :t_rate_id, presence: true

  def self.search(search)
    where("content || title LIKE ?", "%#{search}%")
  end

  def is_writer?(u)
    return true if !u.nil? && u == self.t_rate.user
    false
  end

  def t_save(user)
    if self.save
      t_rate.status = true
      t_rate.save
    end
  end

  def self.other(task_id)
    Submission.where(t_rate_id: TRate.other_ids(task_id))
  end

  def user
    self.t_rate.user
  end

  def user_id
    self.t_rate.user_id
  end
  def task
    self.t_rate.task
  end
  def task_id
    self.t_rate.task_id
  end
end