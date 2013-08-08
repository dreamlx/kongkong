# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.destroy_all
User.destroy_all
AdminUser.create!(:email => 'admin@gmail.com', :password => 'quit11111111', :password_confirmation => '11111111')
User.create!(:email => 'admin@admin.com', :password => '11111111', :password_confirmation => '11111111')
User.create!(:email => 'test@gmail.com', :password => '11111111', :password_confirmation => '11111111')
Dailypost.all.each do |d| 
  d.state = 'default' 
  d.save
end
