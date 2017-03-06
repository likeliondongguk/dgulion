class AddCategoryToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :category, index: true, foreign_key: true
  end
end
