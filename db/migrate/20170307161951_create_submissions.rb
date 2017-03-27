class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :content
      t.string :c9
      t.string :github
      t.references :t_rate, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
