class AddAttachmentImageToSubmissions < ActiveRecord::Migration
  def self.up
    add_attachment :submissions, :image

  end

  def self.down
    remove_attachment :submissions, :image
  end
end
