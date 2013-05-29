class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :title
      t.text :content
      t.string :resourceable
      t.integer :resourceable_id
      t.decimal :price

      t.timestamps
    end
  end
end
