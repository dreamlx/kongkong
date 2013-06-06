class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :credit
      t.decimal :credit_quantity, :precision => 8, :scale => 2
      t.decimal :total, :precision => 8, :scale => 2
      t.string :number
      t.string :state

      t.timestamps
    end
  end
end
