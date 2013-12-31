source 'https://rubygems.org'
gem 'rails', '4.0.0'
gem 'mysql2'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'


# correct depreciation : http://stackoverflow.com/questions/20487127/rails-i18n-validation-deprecation-warning-after-setting-enforce-available-local
gem 'i18n', github: 'svenfuchs/i18n'

gem 'devise'


group :development do
  gem 'thin'
  gem 'letter_opener'
  gem 'capistrano', "~> 2.9.0"
  gem 'capistrano-ext'
  gem 'rvm-capistrano'
end

gem "rspec-rails", :group => [:test, :development] 
group :test do   
  gem "factory_girl_rails"
  gem "capybara"
  gem "launchy"
  gem "capybara-webkit"
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'turn', :require => false
  gem 'faker'
end
