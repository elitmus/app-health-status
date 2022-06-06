RSpec.describe Rack::AppHealthStatusMiddleware do
  let(:app) { ->(env) { [env['HOST'] && env['HOST'] != env['SERVER_NAME'] ? 403 : 404, env, 'app'] } }
  let(:middleware) do
    Rack::AppHealthStatusMiddleware.new(app)
  end

  it 'should return 200 when path matches' do
    code, env = middleware.call env_for('https://www.elitmus.com/app-health-status')
    expect(code).to eq(200)
    user_defined_path = 'some-random-path'
    AppHealthStatus.configuration.path = user_defined_path
    code, env = middleware.call env_for("https://www.elitmus.com/#{user_defined_path}")
    expect(code).to eq(200)
    AppHealthStatus.reset
  end

  it 'should not interfere when path does matches' do
    code, env = middleware.call env_for('https://www.elitmus.com/some-random-path')
    expect(code).to eq(404)
  end

  it 'should give 403 when host is differnt and path is not whitelisted' do
    code, env = middleware.call env_for('https://www.elitmus.com/some-random-path', {
      'HTTP_X_FORWARDED_HOST' => '//randomhost.com',
      'HOST' => 'www.randomhost.com',
      'action_dispatch.show_detailed_exceptions' => true
    })
    
    expect(code).to eq(403)
  end

  def env_for url, opts = {}
    Rack::MockRequest.env_for(url, opts)
  end
end
