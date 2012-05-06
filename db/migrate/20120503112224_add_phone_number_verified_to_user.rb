class AddPhoneNumberVerifiedToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_number_verified, :boolean
  end
end
