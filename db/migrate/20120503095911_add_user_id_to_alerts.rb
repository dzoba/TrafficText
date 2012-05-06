class AddUserIdToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :user_id, :integer
  end
end
