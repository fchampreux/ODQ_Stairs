source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '~> 4.0.0'
gem 'bootstrap-sass', '2.3.2'
gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '2.1.2'
gem 'bcrypt', '~> 3.1.0'
gem 'jquery-rails', '~> 3.0.4'
gem 'turbolinks', '1.3.0'
gem 'jbuilder', '1.4.2'
gem 'bootstrap-datepicker-rails'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'
gem 'selenium-webdriver', '2.42.0'
gem 'sequenced'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

# gem for dev and test only
group :development, :test do
  gem 'pg'
  gem 'annotate', '2.5.0'
  gem 'rspec-rails', '2.14.0'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.0'
end

# gem for SQLServer POC
group :MSSQL do
  gem 'tiny_tds', '~> 0.6.2'
  gem 'activerecord-sqlserver-adapter', '~> 4.0.0'
  gem 'annotate', '2.5.0'
  gem 'rspec-rails', '2.14.0'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.0'
end

# gem for ORACLE POC
group :ORACLE do
  gem 'ruby-oci8', '~> 2.1.0'
  gem 'activerecord-oracle_enhanced-adapter', '~> 1.5.0'
  gem 'annotate', '2.5.0'
  gem 'rspec-rails', '2.14.0'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.0'
end

# gem for production
group :production do
  gem 'rails_12factor'
  gem 'pg'
end





