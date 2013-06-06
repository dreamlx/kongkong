class CreateCreditLineItem < ActiveRecord::Base
  belongs_to :credit
  belongs_to :order
  attr_accessible :amount, :order_id
end
