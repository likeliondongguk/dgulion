class CreateAtts < ActiveRecord::Migration
  def change
    create_table :atts do |t|
      t.references :sch, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
