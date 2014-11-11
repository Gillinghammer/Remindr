class RemoveFriendshipIdFromMeeting < ActiveRecord::Migration
  def change
    remove_column :meetings, :friendship_id
    add_column :meetings, :friend_id, :integer
    add_column :meetings, :user_id, :integer
  end
end
