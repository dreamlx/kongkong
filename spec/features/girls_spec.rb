require "spec_helper"

feature 'girls' do
  background do
    5.times.each { |i| FactoryGirl.create(:girl) }
  end

  scenario 'visit girls,show all girl' do
    visit '/girls'

    Girl.all.each do |girl|
      page.should have_content girl.name
    end
  end

  scenario 'create girl' do
    visit "/girls/new"
    fill_in :girl_name, with: "girl02"
    click_button 'Create Girl'
     page.should have_content "girl02"
  end
end