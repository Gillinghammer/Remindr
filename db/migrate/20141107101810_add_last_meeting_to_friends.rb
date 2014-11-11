class AddLastMeetingToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :last_meeting, :date
  end
end
