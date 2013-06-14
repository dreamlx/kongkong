# coding: utf-8
include ActionDispatch::TestProcess
FactoryGirl.define do

  factory :dailypost do
    content "test"
    girl
    cost Random.rand(0..20)
    state { Random.rand(0..1) == 1 ? "default" : "published" }   
    photo { fixture_file_upload(Rails.root + "spec/fixtures/images/1.jpg", 'image/jpg') } 
  end

end