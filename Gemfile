source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'faraday'
gem 'figaro'
gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'

# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
