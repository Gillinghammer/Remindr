class RemoveRemindInFromFriends < ActiveRecord::Migration
  def change
    remove_column :friends, :remind_in
    add_column :friends, :remind_on, :date
  end
end
