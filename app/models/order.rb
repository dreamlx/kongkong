class Order < ActiveRecord::Base
  attr_accessible :credit_quantity, :number, :state, :credit_id
  belongs_to :credit

  before_validation :generate_order_number, on: :create

  state_machine :state, initial: :credit_owed do
    state :balance_due, :paid, :credit_owed

    event :pay do
      transition :credit_owed => :paid
    end
  end
  
  def generate_order_number
    record = true
    while record
      random = "#{self.class.initial}#{Array.new(9){rand(9)}.join}"
      record = self.class.where(number: random).first
    end
    self.number = random if self.number.blank?
    self.number
  end

    def self.initial
    'K'
  end
end
