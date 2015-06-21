source 'https://rubygems.org'

ruby '2.1.2'
gem 'rails', '4.2.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'thin'
gem 'unicorn', "~> 4.9.0"
gem 'unicorn-worker-killer', "~> 0.4.3"

gem 'pg', "~> 0.18.2"
gem 'nokogiri'

# model annotation
gem 'annotate', "~> 2.6.10"

gem 'sass-rails',   '~> 5.0.3'
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby

gem 'uglifier', '~> 2.7.1'

gem 'bootstrap-sass', '~> 3.1.1.1'
# gem 'compass'

group :development, :test do
  gem "rspec-rails", "~> 3.3.2"
  gem "guard-rspec", "~> 4.5.2"
  gem "factory_girl_rails", "~> 4.5.0"
  gem "faker"
  
  gem 'spring', '~> 1.3.6'
  gem "spring-commands-rspec"
end

gem 'dotenv-rails', "~> 2.0.2"

gem 'jquery-rails'

group :test do
  gem 'webmock', "~> 1.20.4"
  gem 'capybara', '~> 2.4.1'

  # Test gems on Macintosh OS X
  gem 'rb-fsevent', '~> 0.9.1', :require => false
  gem 'terminal-notifier-guard'
  # gem "growl", "~> 1.0.3"
  
  # # Test gems for Linux
  # gem 'rb-inotify', '0.8.8'
  # gem 'libnotify', '0.5.9'  
  
  # # Test gems for Windows
  # gem 'rb-fchange', '0.0.5'
  # gem 'rb-notifu', '0.0.4'
  # gem 'win32console', '1.3.0'  
end

gem 'foreman'

# authentication
gem "devise", "~> 3.5.1"

# authorization
gem 'cancancan', '~> 1.11.0'

gem "url_formatter", :github => "cyrusstoller/url_formatter", :ref => "master"

# pagination
gem "will_paginate", "~> 3.0.7"
gem "bootstrap-will_paginate", "~> 0.0.9"

# geolocation
gem "geocoder", "~> 1.2.3"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# To use Jbuilder templates for JSON
gem 'jbuilder', "~> 2.3.0"

# Google Analytics
gem "gabba", "~> 1.0.1"

# # Only for Heroku Deployments
# # Uncomment if you want logging on Heroku
# group :production, :staging do
#   gem "rails_12factor", "~> 0.0.2"
# end

gem "newrelic_rpm", "~> 3.12.0.288"

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
group :development do
  gem "capistrano", "~> 3.4.0"
  gem 'capistrano-rbenv', '~> 2.0'
  gem "capistrano-bundler", "~> 1.1.0"
  gem "capistrano-rails", "~> 1.1.0"
end

# To use debugger
# gem 'debugger'
