source 'https://rubygems.org'

gem 'rails', '3.2.14'
gem 'bcrypt-ruby', '3.0.1'
gem 'strong_parameters'
gem 'acts-as-taggable-on'
gem 'mail'
gem "railroady"
gem "carrierwave"
gem 'rmagick'
gem 'mail_form'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


#gem 'sqlite3'
group :development,:test do
  gem 'sqlite3'
  gem 'factory_girl'
  gem 'factory_girl_rails', '4.2.1'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'database_cleaner'
end
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'less-rails'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
  gem 'less-rails-fontawesome'
  gem "haml-bootstrap-rails", "~> 0.3.11"
  gem "holder_rails"
end

gem 'jquery-rails'
gem "haml", "~> 3.1"

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
