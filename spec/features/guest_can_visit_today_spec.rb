require "spec_helper"

feature 'guest can visit today, today is root path' do
  background do
    @dailypost = FactoryGirl.create(:dailypost, :state => 'published')

    5.times.each { |i| FactoryGirl.create(:girl) }
    20.times.each { |i| FactoryGirl.create(:dailypost) }
  end

  scenario 'visit girls,show all girl' do
    visit "/"

    page.should  have_content "jpg"
  end

end