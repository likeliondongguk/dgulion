class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :content
      t.string :image_url

      t.timestamps null: false
    end
  end
end
