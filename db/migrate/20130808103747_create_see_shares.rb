class CreateSeeShares < ActiveRecord::Migration
  def change
    create_table :see_shares do |t|
      t.integer :share_id
      t.integer :user_id
      t.timestamps
    end
  end
end
