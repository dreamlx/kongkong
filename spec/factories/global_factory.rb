# coding: utf-8
FactoryGirl.define do
  sequence(:random_string) {|n| LoremIpsum.generate }

end