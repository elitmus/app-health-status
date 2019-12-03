# frozen_string_literal: true

module AppHealthStatus
  # The Engine will provide the features of this gem to the rails app
  class Engine < ::Rails::Engine
    isolate_namespace AppHealthStatus

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
