class AddPhoneNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_numeber, :string
  end
end
