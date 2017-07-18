source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.2"

gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "turbolinks", "~> 5"

# authentication
gem "devise"
gem "doorkeeper"
gem "rack-attack"
gem "rack-cors"

# authorization
gem "pundit"

# grape
gem "grape"
gem "grape-active_model_serializers"
gem "grape-swagger"
gem "grape-swagger-rails", "~> 0.3.0"
gem "grape_logging"
gem "hashie-forbidden_attributes" # needed to make grape params validation work

# jsonapi
gem "grape-jsonapi-resources"
gem "jsonapi-resources"

# pagination
gem "grape-kaminari"
gem "kaminari"
gem "kaminari-grape"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
