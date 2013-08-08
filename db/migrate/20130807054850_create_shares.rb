class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :user_id
      t.integer :dailypost_id
      t.string :photo_url
      t.timestamps
    end
  end
end
