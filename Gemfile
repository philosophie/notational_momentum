source "https://rubygems.org"

gem "rails", "3.2.13"

gem "pg", "~> 0.14.0"

gem "email_validator", "~> 1.3.0"

gem "devise", "~> 2.2.3"


# Security
gem "strong_parameters", "~> 0.1.3"
gem "bcrypt-ruby", "~> 3.0.1", require: "bcrypt"

group :assets do
  gem "sass-rails", "~> 3.2.3"
  gem "coffee-rails", "~> 3.2.2"
  gem "uglifier", "~> 1.2.6"
  gem "jquery-rails", "~> 2.0.2"
  gem "handlebars_assets", "~> 0.6.2"
end

group :staging, :production do
  gem "thin", "~> 1.5.0"
end

group :development do
  gem "rails-default-database", "~> 1.0.6"
end
