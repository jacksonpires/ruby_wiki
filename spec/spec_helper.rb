require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/poltergeist'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/features/macros/**/*.rb')].each { |f| require f }

Rails.logger.level = 4 # reduce the IO during tests
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = true
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.expect_with(:rspec) { |c| c.syntax = :expect }
  config.order = 'random'

  config.include FactoryGirl::Syntax::Methods

  config.before do
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end

Capybara.configure do |config|
  config.javascript_driver      = :poltergeist
  config.ignore_hidden_elements = true
  config.default_selector       = :css
  config.exact_options          = true
  config.visible_text_only      = true
  config.match                  = :one
  config.default_wait_time      = 10
end
