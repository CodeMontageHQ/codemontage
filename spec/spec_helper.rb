# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= "test"

require "simplecov"
SimpleCov.start do
  add_filter "/config/"
  add_filter "/spec/"
  add_filter "/admin/"
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Helpers", "app/helpers"
  add_group "Services", "app/services"
end

require File.expand_path("../../config/environment", __FILE__)

require "rspec/rails"
require "rspec/autorun"
require "capybara/rspec"
require "vcr"
require "factory_girl"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

VCR.configure do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.hook_into :fakeweb
  c.filter_sensitive_data("<GITHUB_KEY>") { ENV["GITHUB_KEY"] }
  c.filter_sensitive_data("<GITHUB_SECRET>") { ENV["GITHUB_SECRET"] }
end

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Include Factory Girl syntax to simplify calls to factories
  config.include FactoryGirl::Syntax::Methods

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end
