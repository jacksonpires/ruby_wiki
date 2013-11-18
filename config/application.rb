require File.expand_path('../boot', __FILE__)
require 'active_record/railtie'
require 'action_controller/railtie'
# require 'action_mailer/railtie'
require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

Bundler.require(:default, Rails.env)

module RubyWiki
  class Application < Rails::Application
    config.time_zone = 'Brisbane'
    config.i18n.default_locale = :en

    config.generators do |g|
      g.test_framework :rspec, fixture: false, views: false
    end
  end
end
