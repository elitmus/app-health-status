# frozen_string_literal: true

module AppHealthStatus
  # This is where the path specified in configuration is going to land.
  class StaticController < ActionController::Base
    def index
      head :ok
    end
  end
end
