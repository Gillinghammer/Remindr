class AddRemindToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :remind_interval, :integer
  end
end
