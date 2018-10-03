source 'https://rubygems.org'

gem 'rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3'
gem 'sass-rails',   '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'uglifier', '~> 3.0'
gem 'bcrypt', '~> 3.1'
gem 'jquery-rails', '~> 4.1'
gem 'turbolinks', '~> 5.0'
gem 'jbuilder', '~> 2.6'
gem 'bootstrap-datepicker-rails', '~> 1.6'
gem 'will_paginate', '~> 3.1'
gem 'd3-rails'
gem 'httparty', '~> 0.14'
gem 'nested_form_fields'
gem 'pg'

# XLSX format support
gem 'iconv'
gem 'write_xlsx'
gem 'roo'

# gem 'rails-i18n', '~> 5.1'

# Authorisations
gem 'devise'
gem 'cancancan', '~> 2.0'

# MarkDown parser
gem 'redcarpet'
# eMail notification support
gem 'mailgun-ruby', '~>1.1'

# gem for dev and test only
group :development, :test, :eval do
  gem 'annotate', '~> 2.7'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_bot_rails'
  gem 'capybara', '~> 2.7'
  gem 'selenium-webdriver', '~> 2.53'
end

group :development do
  gem 'web-console',           '~>3.1'
  gem 'listen',                '~>3.0'
  gem 'spring',                '~>1.7'
  gem 'spring-watcher-listen', '2.0'
end

# gem for SQLServer POC
# group :MSSQL do
#  gem 'tzinfo-data', '~> 1.2'
#  gem 'tiny_tds', '~> 1.0'
#  gem 'activerecord-sqlserver-adapter', '~> 4.2'
# end

# gem for ORACLE POC
group :ORACLE do
  gem 'ruby-oci8', '~> 2.2'
  gem 'activerecord-oracle_enhanced-adapter', '~> 1.7'
end

# gem for production
group :production do
  gem 'rails_12factor'
end





