class RemoveImageFromTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :image, :string
  end
end
