# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "bootsnap", require: false
gem "devise"
gem "dotenv"
# gem "image_processing"
gem "importmap-rails"
gem "inline_svg"
gem "jbuilder"
gem "jsbundling-rails"
gem "puma", ">= 5.0"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "redis", ">= 4.0.1"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "view_component"

group :development, :test do
  gem "active_record_doctor"
  gem "bullet"
  gem "debug", platforms: %i[ mri windows ]
  gem "factory_bot_rails"
  gem "ffaker"
  gem "i18n-tasks"
  gem "rspec-rails"
end

group :development do
  gem "brakeman"
  gem "bundler-audit"
  gem "erb_lint"
  gem "letter_opener"
  gem "letter_opener_web"
  gem "pry"
  gem "rails_best_practices"
  gem "rubocop"
  gem "rubocop-capybara"
  gem "rubocop-factory_bot"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "rubocop-rspec_rails"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "database_cleaner-active_record"
  gem "rails-controller-testing"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end
