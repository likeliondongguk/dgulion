class CreateStudyinfos < ActiveRecord::Migration
  def change
    create_table :studyinfos do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :wday

      t.timestamps null: false
    end
  end
end
