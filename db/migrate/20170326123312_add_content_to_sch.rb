class AddContentToSch < ActiveRecord::Migration
  def change
    add_column :sches, :content, :text
    add_column :sches, :image, :string
  end
end
