class RenameFriendsToContacts < ActiveRecord::Migration
    def change
      rename_table :friends, :contacts
    end 
end
