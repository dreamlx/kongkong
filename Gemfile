#source 'https://rubygems.org'
source 'http://ruby.taobao.org'
gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'qiniu-rs'
gem 'carrierwave'
gem 'carrierwave-qiniu'

gem "slim-rails"
gem "devise"
gem "twitter-bootstrap-rails"

gem 'simple_form'
gem "nested_form"
gem 'activeadmin'
gem 'state_machine'
gem 'awesome_nested_set'
gem 'fog'

gem "rvm-capistrano"
gem 'capistrano', '~> 2.12.0'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.3.1.2'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'pg'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'spork'
end

group :production do
  gem 'mysql2'
  gem 'thin'
end