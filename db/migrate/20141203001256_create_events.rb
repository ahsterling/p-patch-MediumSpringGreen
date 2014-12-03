class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.integer :user_id
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
