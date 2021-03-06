source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Auto-deployment
group :development do
  # Use Mina for deployment
  gem 'mina'
  gem 'mina-puma', :require => false

  # livereload
  gem 'guard'
  gem 'guard-livereload'
end

gem 'puma'

# debug
gem "pry"
gem "pry-rails"
gem "awesome_print", :require => false

group :development, :test do # 也包含 test 是為了讓寫 test case 時也可以 debug
  # gem "pry-plus"
  gem "hirb", :require => false
  gem "hirb-unicode", :require => false
end

group :development do
  gem "pry-remote"
end

# RSpec
group :development, :test do
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"
end

group :test do
  gem "faker", "~> 1.1.2"
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.0.1"
  gem "launchy", "~> 2.3.0"
  gem "selenium-webdriver", "~> 2.39.0"
end

gem 'hasami', github: 'jiunjiun/hasami'

# User account
gem 'devise'
gem 'devise-i18n'

# User role
gem 'rolify'
gem 'cancancan', '~> 1.10'

# Style
# gem 'compass-rails'
gem 'haml'
gem "font-awesome-rails"
gem 'materialize-sass'
gem 'bootstrap-sass'
gem 'pickadate-rails'
gem "animate-rails"
gem "highcharts-rails"

# Upload, zip image
# gem 'carrierwave'
# gem 'mini_magick'

# config file
gem 'settingslogic'

# Use for google analytics
gem 'google-analytics-rails'

# auto page
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap'

# SEO
gem 'meta-tags', :require => 'meta_tags'
gem 'sitemap_generator'

# cron
gem 'whenever', :require => false

gem 'active_hash'

gem 'i18n-country-translations'

