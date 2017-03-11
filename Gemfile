source 'https://rubygems.org'

ruby '2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'cancancan', '~> 1.15'
gem 'responders', '~> 2.3'
gem 'acts_as_list', '~> 0.9.2'
gem 'omniauth', '~> 1.3', '>= 1.3.1'
gem 'devise_token_auth', '~> 0.1.39'
gem 'active_model_serializers', '~> 0.10.4'

group :development, :test do
  gem 'pry-rails', '~> 0.3.5'
  gem 'json-schema', '~> 2.7'
  gem 'faker', '~> 1.7', '>= 1.7.2'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
end

group :development do
  gem 'listen', '~> 3.1', '>= 3.1.5'

  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0', '>= 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
