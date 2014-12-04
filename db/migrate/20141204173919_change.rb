class Change < ActiveRecord::Migration
  def change
    rename_column :tools, :kind, :name
  end
end
