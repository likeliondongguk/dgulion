class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body
      t.references :user, index: true, foreign_key: true
      t.boolean :check, default: false

      t.timestamps null: false
    end
  end
end
