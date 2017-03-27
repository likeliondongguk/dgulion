class AddImageToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :image, :string
  end
end
