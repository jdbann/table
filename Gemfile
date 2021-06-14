source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.6"

gem "clearance"
gem "image_processing"
gem "inline_svg"
gem "interactor-rails"
gem "jbuilder", "~> 2.11"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 5.2"
gem "rails", "6.1.3.1"
gem "redis", "~> 4.3"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"

gem "aws-sdk-s3", require: false

gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
  gem "rspec-rails", "~> 5.0.1"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.6"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "scss_lint", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "factory_bot_rails"
  gem "rspec_junit_formatter"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "webdrivers"
end

group :production do
  gem "rack-canonical-host"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
