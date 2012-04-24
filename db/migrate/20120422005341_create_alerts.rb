class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :url
      t.time :start
      t.time :end
      t.boolean :active
      t.integer :user

      t.timestamps
    end
  end
end
