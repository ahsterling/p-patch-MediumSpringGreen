class ChangeToolTypeAttribute < ActiveRecord::Migration
  def change
    rename_column :tools, :type, :kind
  end
end
