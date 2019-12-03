# AppHealthStatus

This Simple Gem provides an configurable endpoint to check your rails app health status.

## Usage
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
