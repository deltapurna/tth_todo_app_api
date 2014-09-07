require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TthTodoAppApi
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    config.middleware.use Rack::Cors do
      allow do
        origins 'learn.localhost'
        resource '/tasks', headers: :any, methods: :get
      end
    end
  end
end
