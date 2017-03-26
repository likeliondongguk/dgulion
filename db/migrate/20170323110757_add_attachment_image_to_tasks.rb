class AddAttachmentImageToTasks < ActiveRecord::Migration
  def self.up
    add_attachment :tasks, :image
  end

  def self.down
    remove_attachment :tasks, :image

  end
end
