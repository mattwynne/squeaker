source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '~> 3.2'
gem 'thin'
gem 'jquery-rails'

group :production do
  gem "pg"
end

group :development, :test do
  gem "sqlite3", :require => "sqlite3"
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'rspec'
  gem 'database_cleaner'
  gem 'launchy'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

