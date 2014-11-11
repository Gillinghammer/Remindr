class AddReminderToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :remind, :string
  end
end
