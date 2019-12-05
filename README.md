# AppHealthStatus

[![Build Status](https://travis-ci.org/elitmus/app-health-status.svg?branch=master)](https://travis-ci.org/elitmus/app-health-status)

This Simple Middleware Gem provides an configurable endpoint to check your rails app health status.

When your app will be requested with the endpoint specified in this gem, the middleware will interfere with the request and return status 200.

Since the middleware is included in gem we can safely assume that this will return status 200 only when your app is up and running.

## Usage

This middleware will be automatically added to you app if it detects an rails app.

The default endpoint is set to `app-health-status`.

You configure the endpoint in the following way:

```rb
# config/intializers/app_health_status.rb
AppHealthStatus.configure do |config|
  config.path = 'some-random-path'
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'app_health_status'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install app_health_status
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
