RSpec.describe Rack::AppHealthStatusMiddleware do
  let(:app) { ->(env) { [404, env, "app"] } }
  let(:middleware) do
    Rack::AppHealthStatusMiddleware.new(app)
  end

  it 'should return 200 when path matches' do
    code, env = middleware.call env_for('https://www.pacexam.com/app-health-status')
    expect(code).to eq(200)
    user_defined_path = 'some-random-path'
    AppHealthStatus.configuration.path = user_defined_path
    code, env = middleware.call env_for("https://www.pacexam.com/#{user_defined_path}")
    expect(code).to eq(200)
    AppHealthStatus.reset
  end

  it 'should not interfere when path does matches' do
    code, env = middleware.call env_for('https://www.pacexam.com/some-random-path')
    expect(code).to eq(404)
  end

  def env_for url
    Rack::MockRequest.env_for(url)
  end
end
