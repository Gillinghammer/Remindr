class Reminder < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :interval
      t.integer :friend_id
      t.integer :countdown
      t.timestamps
    end
  end
end
