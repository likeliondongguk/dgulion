class AddLevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :level, :integer
    add_column :users, :admin, :boolean
    change_column_default :users, :admin, false
    change_column_default :users, :level, 1
  end
end
