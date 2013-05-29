# coding: utf-8
FactoryGirl.define do
  sequence(:random_string) {|n| LoremIpsum.generate }

  factory :girl do
    sequence(:name) { |n| "girl#{n}" }
    birthday        { 21.years.ago }
    blood_type      'A'
    bwh             "22-33-22"
    description     "about me"
    height          165
    hobby           "无"
    nationality     'china'
    special_skill   '无'       
  end

end
