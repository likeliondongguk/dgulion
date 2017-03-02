class RemovePostFromTags < ActiveRecord::Migration
  def change
    remove_reference :tags, :post, index: true, foreign_key: true
  end
end
