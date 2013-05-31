class CreateDailyposts < ActiveRecord::Migration
  def change
    create_table :dailyposts do |t|
      t.integer :girl_id
      t.text :content
      t.string :photo
      t.string :linkto

      t.timestamps
    end
  end
end
