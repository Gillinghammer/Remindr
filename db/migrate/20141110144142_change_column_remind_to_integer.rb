class ChangeColumnRemindToInteger < ActiveRecord::Migration
  def change
      remove_column :friends, :remind
      add_column :friends, :remind_in, :integer
    end
end
