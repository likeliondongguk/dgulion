class AddTaskToSubmission < ActiveRecord::Migration
  def change
    add_reference :submissions, :task, index: true, foreign_key: true
  end
end
