# frozen_string_literal: true

Rails.application.routes.draw do
  get AppHealthStatus.configuration.path => 'app_health_status/static#index'
end
