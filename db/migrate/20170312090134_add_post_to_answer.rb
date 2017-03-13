class AddPostToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :post, index: true, foreign_key: true
  end
end
