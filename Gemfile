source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7'
# Use pg as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.6.1'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# State Machine
gem 'state_machine'
# Upload images
gem 'carrierwave'
gem 'rmagick', :require => 'RMagick'
gem 'fog'
# Use Unicorn as the app server
gem 'unicorn'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :test do
  # Collection of testing matchers
  gem 'shoulda-matchers'
  # Strategies for cleaning databases
  gem 'database_cleaner'
  # Acceptance test framework
  # Launchy so we can use the save_and_open_page functionality when testing.
  gem 'launchy'
  # To mock network calls
  gem 'webmock', '~> 2.0.3'
  # to test the app
  gem "rspec-rails"
  # To create model mocks
  gem 'factory_girl_rails'
  # to maintain session in integration tests
  gem 'rack_session_access'
  # Jenkins result-format gem
  gem 'ci_reporter_rspec'
  # to take screenshots in case of error
  gem 'capybara-screenshot'
  # for better circle ci test information
  gem 'rspec_junit_formatter', '0.2.2'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


