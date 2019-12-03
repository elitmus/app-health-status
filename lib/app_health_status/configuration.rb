# frozen_string_literal: true

# This will allow to modify configuration for the gem
module AppHealthStatus
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end

    def reset
      @configuration = Configuration.new
    end
  end

  # This class is responsible for holding the values of user defined configurations
  class Configuration
    attr_accessor :path

    def initialize
      @path = 'app-health-status'
    end
  end
end
