# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visit_history do
    dailypost_id ""
    user_id ""
    state "MyString"
    visit_count 1
  end
end
