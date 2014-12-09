class ChangeUserTypeToStatus < ActiveRecord::Migration
  def change
    rename_column :users, :type, :status
  end
end
