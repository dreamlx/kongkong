# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :create_credit_line_item do
    credit nil
    order nil
    amount "9.99"
  end
end
