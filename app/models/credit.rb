class Credit < ActiveRecord::Base
  attr_accessible :balance, :start_balance
  belongs_to :user
  has_many :orders
  has_many :create_credit_line_items
  validates_uniqueness_of :id
  def caculate_balance(order, desc = "")
    self.balance += order.credit_quantity
    self.save

    self.create_credit_line_items.build(:order_id => order.id, :amount => order.credit_quantity)
  end
end
