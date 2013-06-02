require "spec_helper"

feature 'girls' do
  background do
    5.times.each { |i| FactoryGirl.create(:girl) }
  end

  scenario 'visit api girls' do
    visit '/api/girls.json'

    Girl.all.each do |girl|
      page.should have_content girl.name
    end
  end

end