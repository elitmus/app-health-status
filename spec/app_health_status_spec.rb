# frozen_string_literal: true

RSpec.describe AppHealthStatus do
  it 'has a version number' do
    expect(AppHealthStatus::VERSION).not_to be nil
  end

  it 'path should be configurable' do
    expect(AppHealthStatus.configuration.path).to eq('app-health-status')
    user_defined_path = 'some_random_path'
    AppHealthStatus.configure do |config|
      config.path = user_defined_path
    end
    expect(AppHealthStatus.configuration.path).to eq(user_defined_path)
  end
end
