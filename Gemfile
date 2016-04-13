source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '~> 4.2.0'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'sass-rails',   '~> 5.0.1'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '~> 2.7'
gem 'bcrypt', '= 3.1.7'
gem 'jquery-rails', '~> 4.0.3'
gem 'turbolinks', '2.5.3'
gem 'jbuilder', '~> 2.3.0'
gem 'bootstrap-datepicker-rails', '~> 1.4.0'
gem 'will_paginate', '~> 3.0.7'
gem 'bootstrap-will_paginate', '~> 0.0.10'
gem 'selenium-webdriver', '~> 2.47.0'
gem 'sequenced', '~> 2.0.0'
gem 'd3_rails'
gem 'httparty'
gem 'roo'
group :doc do
  gem 'sdoc', '0.3.20', require: false
end

# gem for dev and test only
group :development, :test, :eval do
  gem 'pg'
  gem 'annotate', '~> 2.6.5'
  gem 'shoulda-matchers'
  gem 'rspec-rails', '~> 3.3.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'capybara'
  gem 'database_cleaner'
end

# gem for SQLServer POC
group :MSSQL do
  gem 'tzinfo-data'
  gem 'tiny_tds', '~> 0.7.0'
  gem 'activerecord-sqlserver-adapter', '~> 4.2.2'
end

# gem for ORACLE POC
group :ORACLE do
  gem 'ruby-oci8', '~> 2.1.7'
  gem 'activerecord-oracle_enhanced-adapter', '~> 1.6.3'
end

# gem for production
group :production do
  gem 'rails_12factor'
  gem 'pg'
end





