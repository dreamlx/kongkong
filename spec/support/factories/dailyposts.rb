# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dailypost do
    girl_id 1
    content "MyText"
    photo "MyString"
    linkto "MyString"
  end
end
