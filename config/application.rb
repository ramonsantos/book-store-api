# frozen_string_literal: true

require_relative 'boot'

require 'rails'

require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'

Bundler.require(*Rails.groups)

module BookStoreApi; end

class BookStoreApi::Application < Rails::Application
  config.load_defaults(7.1)
  config.api_only = true
  config.autoload_lib(ignore: ['assets', 'tasks'])

  config.active_storage.draw_routes = false

  # Test files generator
  config.generators do |generator|
    generator.test_framework(
      :rspec,
      fixtures: false,
      request_specs: true,
      controller_specs: false,
      routing_specs: false
    )
  end
end
