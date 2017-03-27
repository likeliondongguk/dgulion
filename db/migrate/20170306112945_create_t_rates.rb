class CreateTRates < ActiveRecord::Migration
  def change
    create_table :t_rates do |t|
      t.references :user, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
