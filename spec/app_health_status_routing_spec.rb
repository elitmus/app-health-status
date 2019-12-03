describe AppHealthStatus::StaticController, type: [:request, :controller] do
  describe 'routing' do
    it 'routes to index' do
      get "/app-health-status"
      expect(response).to have_http_status(:success)
      user_defined_route = 'some-random-route'
      AppHealthStatus.configure do |config|
        config.path = user_defined_route
      end
      Rails.application.reload_routes!
      get "/#{user_defined_route}"
      expect(response).to have_http_status(:success)
      AppHealthStatus.reset
    end
  end
end
