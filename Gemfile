source 'https://rubygems.org'
ruby "2.4.1"
gem 'rails', '5.1'

# UI
gem 'draper'
gem 'haml-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'sass-rails'
gem 'devise'
gem 'font-awesome-rails'

gem 'simple_form'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# DB
gem 'pg'

gem 'puma'
gem "httparty"

# validation tools
gem 'phony_rails'
gem 'going_postal'

gem 'paperclip'
gem 'aws-sdk'

gem 'filterrific'
gem 'kaminari'
gem 'pg_search'

# TODO - move to staging group (not needed in production)
gem 'fabrication'
gem 'ffaker'

gem 'appsignal'

gem 'decent_exposure'

group :development do
  gem 'bullet'
  gem 'better_errors'
  gem 'web-console'
  # gem 'binding_of_caller'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'rspec-given',  :require => false
  gem 'rspec-rails', require: false
  gem 'email_spec', require: false
  gem 'database_cleaner'
  gem 'chromedriver-helper'
  gem 'capybara-selenium'
  gem 'launchy'
  gem 'coderay'
  gem "webmock", require: false
  gem "vcr", require: false
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'byebug'
  gem 'dotenv-rails'
end

# IF HEROKU
group :production, :staging do
  gem 'rails_12factor'
end
