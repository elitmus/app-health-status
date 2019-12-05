# frozen_string_literal: true

module Rack
  # This is where the request is going to land
  class AppHealthStatusMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == "/#{AppHealthStatus.configuration.path}" && env['REQUEST_METHOD'] == 'GET'
        [
          200,
          { 'Content-Type' => 'text/html' },
          []
        ]
      else
        @app.call(env)
      end
    end
  end
end
