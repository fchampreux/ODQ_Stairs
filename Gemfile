source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '~> 4.2.0'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'sass-rails',   '~> 5.0.1'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '~> 2.7'
gem 'bcrypt', '~> 3.1.10'
gem 'jquery-rails', '~> 4.0.3'
gem 'turbolinks', '2.5.3'
gem 'jbuilder', '~> 2.2.6'
gem 'bootstrap-datepicker-rails', '~> 1.3.1'
gem 'will_paginate', '~> 3.0.7'
gem 'bootstrap-will_paginate', '~> 0.0.10'
gem 'selenium-webdriver', '~> 2.44.0'
gem 'sequenced', '~> 2.0.0'
gem 'annotate', '~> 2.6.5'
gem 'rspec-rails', '~> 3.2.0'
gem 'capybara', '~> 2.4.4'
gem 'factory_girl_rails', '~> 4.5.0' 

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

# gem for dev and test only
group :development, :test do
  gem 'pg'

end

# gem for SQLServer POC
group :MSSQL do
  gem 'tiny_tds', '~> 0.6.2'
  gem 'activerecord-sqlserver-adapter', '~> 4.2.2'
end

# gem for ORACLE POC
group :ORACLE do
  gem 'ruby-oci8', '~> 2.1.7'
  gem 'activerecord-oracle_enhanced-adapter', github: 'rsim/oracle-enhanced', branch: 'rails42'
end

# gem for production
group :production do
  gem 'rails_12factor'
  gem 'pg'
end





