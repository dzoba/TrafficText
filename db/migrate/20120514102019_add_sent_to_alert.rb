class AddSentToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :sent, :boolean
  end
end
