FactoryGirl.define do
  factory :user do
    sequence(:username){ |n| "testuser#{n}" }
    sequence(:email){ |n| "email#{n}@factory.com" }
    password "88888888"
    password_confirmation "88888888"
  end
end