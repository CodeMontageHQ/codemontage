source 'https://rubygems.org'
ruby '2.1.5'

# Admin Tools
gem 'activeadmin'
gem 'meta_search',    '>= 1.1.0.pre'

# Baseline Infrastructure
gem 'rails', '3.2.19'
gem 'jquery-rails'
gem 'pg'
gem 'psych', '~> 2.0.0'

# Operations
gem 'newrelic_rpm', '~> 3.9.0.229'

# Users & Authentication
gem 'bcrypt-ruby', require: 'bcrypt'
gem 'devise', '~> 3.3.0'
gem 'omniauth'
gem 'omniauth-github'
gem 'simple_form'

# Data & Features
gem 'acts-as-taggable-on', '~> 3.4.2'
gem 'friendly_id', '~> 4.0.10'
gem 'geocoder'
gem 'octokit', '~> 3.5.2'
gem 'paperclip', '~> 3.0'
gem 'aws-sdk'
gem 'intercom-rails'
gem 'intercom', '~> 2.4.4'

gem 'client_side_validations'
gem 'client_side_validations-simple_form'

# Test Suite
group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
  gem 'vcr'
  gem 'fakeweb'
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', '~> 0.7.1'
end

# Development helpers
group :development do
  gem 'quiet_assets'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # Foundation front-end framework
  gem 'compass-rails'
  gem 'zurb-foundation', '~> 4.0.0'
  gem 'uglifier', '>= 1.0.3'
end
