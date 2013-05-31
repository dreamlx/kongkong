class CreateLoserLikes < ActiveRecord::Migration
  def change
    create_table :loser_likes do |t|
      t.integer :loser_id
      t.integer :girl_id
      t.string :title
      t.string :state

      t.timestamps
    end
  end
end
