class CreateCreateCreditLineItems < ActiveRecord::Migration
  def change
    create_table :create_credit_line_items do |t|
      t.references :credit
      t.references :order
      t.decimal :amount

      t.timestamps
    end
    add_index :create_credit_line_items, :credit_id
    add_index :create_credit_line_items, :order_id
  end
end
