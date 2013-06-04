source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.11'
gem 'thin'

group :production do
  gem "pg"
end

group :development, :test do
  gem "sqlite3", :require => "sqlite3"
  gem 'capybara'
  gem 'cucumber'
end

# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
