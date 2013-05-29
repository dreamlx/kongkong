class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :name
      t.date :birthday
      t.string :bwh
      t.integer :height
      t.string :blood_type
      t.string :nationality
      t.string :special_skill
      t.string :hobby
      t.text :description

      t.timestamps
    end
  end
end
