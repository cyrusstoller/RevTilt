source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'thin'

gem 'pg'
gem 'nokogiri'

# model annotation
gem 'annotate', "~> 2.5.0"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem "zurb-foundation", "~> 4.1.2"
end

group :development, :test do
  gem "rspec-rails", "~> 2.12.1"
  gem "guard-rspec", "~> 2.3.3"
  gem "factory_girl_rails", "~> 4.2.1"
  gem "faker"
  
  gem "guard-spork", "~> 1.4.3"
  gem "spork", "~> 0.9.2"
end

gem 'jquery-rails'

group :test do
  gem 'webmock'
  gem 'capybara', '1.1.2'

  # Test gems on Macintosh OS X
  gem 'rb-fsevent', '~> 0.9.1', :require => false
  gem "growl", "~> 1.0.3"
  
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
gem "devise", "~> 2.2.3"

# authorization
gem "cancan", "~> 1.6.8"

gem "url_formatter", "~> 0.0.1"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
