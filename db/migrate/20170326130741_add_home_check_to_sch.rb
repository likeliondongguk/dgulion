class AddHomeCheckToSch < ActiveRecord::Migration
  def change
    add_column :sches, :home_check, :boolean
  end
end
