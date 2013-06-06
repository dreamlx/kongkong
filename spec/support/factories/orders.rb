# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user ""
    credit_quantity "9.99"
    number "MyString"
    state "MyString"
  end
end
