class AddRemindIntervalToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :remind_interval, :string
  end
end
