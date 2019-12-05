# frozen_string_literal: true

require 'rack'
require 'app_health_status/version'
require 'app_health_status/configuration'
require 'rack/app_health_status_middleware'
require 'app_health_status/railtie' if defined?(Rails)

# This is what rails app will finally have access to, please include all you files here
module AppHealthStatus; end
