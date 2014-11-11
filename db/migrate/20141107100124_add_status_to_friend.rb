class AddStatusToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :status, :string
  end
end
