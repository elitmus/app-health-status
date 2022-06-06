# frozen_string_literal: true

module AppHealthStatus
  # The Railtie will provide the features of this gem to the rails app
  class Railtie < ::Rails::Railtie
    initializer 'app_health_status.configure_rails_initialization' do
      Rails.application.middleware.use Rack::AppHealthStatusMiddleware

      if Rails.application.config.respond_to?(:host_authorization) && Rails.application.config.host_authorization[:exclude].nil?
        Rails.application.config.host_authorization = {
          exclude: ->(request) { request.path.include?(AppHealthStatus.configuration.path) }
        }
      end
    end
  end
end
