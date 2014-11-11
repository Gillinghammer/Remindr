class FixColumnName < ActiveRecord::Migration
 def change
     rename_column :meetings, :friend_id, :contact_id
   end
end
