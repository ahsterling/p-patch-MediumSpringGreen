class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :type
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
