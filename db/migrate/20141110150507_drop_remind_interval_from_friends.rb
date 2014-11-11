class DropRemindIntervalFromFriends < ActiveRecord::Migration
  def change
    remove_column :friends, :remind_interval
  end
end
