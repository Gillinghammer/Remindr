class AddReceiveUpdatesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :receive_updates, :boolean
  end
end
