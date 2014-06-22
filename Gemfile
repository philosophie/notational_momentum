source "https://rubygems.org"

gem 'rails', '4.1.1'
gem 'pg', '~> 0.17.1'
gem 'sass-rails', '~> 4.0.3'
gem 'compass-rails', '~> 1.1.7'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '~> 3.1.0'
gem 'backbone-rails', '~> 1.1.2'
gem 'font-awesome-rails', '~> 4.1.0.0'

gem "email_validator", '~> 1.4.0'

# Security
gem "bcrypt-ruby", "~> 3.0.1", require: "bcrypt"

gem "handlebars_assets", '~> 0.17'

group :staging, :production do
  gem "thin"
end

group :development do
  gem "rails-default-database"
end
