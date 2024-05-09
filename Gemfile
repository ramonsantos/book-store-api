# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.1'

gem 'bootsnap', require: false
gem 'devise', '~> 4.9', '>= 4.9.4'
gem 'devise-jwt', '~> 0.11.0'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'pundit', '~> 2.3', '>= 2.3.2'
gem 'rack-cors', '~> 2.0', '>= 2.0.2'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'
gem 'versionist', '~> 2.0', '>= 2.0.1'

group :development, :test do
  gem 'amazing_print'
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'brakeman', '~> 6.1', '>= 6.1.2'
  gem 'rubocop', '~> 1.61'
  gem 'rubocop-factory_bot', '~> 2.25', '>= 2.25.1'
  gem 'rubocop-performance', '~> 1.20', '>= 1.20.2'
  gem 'rubocop-rails', '~> 2.24'
  gem 'rubocop-rake', '~> 0.6.0'
  gem 'rubocop-rspec', '~> 2.27', '>= 2.27.1'
  gem 'rubocop-thread_safety', '~> 0.5.1'
  gem 'ruby-lsp', '~> 0.16.6'
end

group :test do
  gem 'database_cleaner', '~> 2.0', '>= 2.0.2'
  gem 'rspec-rails', '~> 6.1', '>= 6.1.1'
  gem 'shoulda-matchers', '~> 6.1'
  gem 'simplecov', '0.17.1'
end
