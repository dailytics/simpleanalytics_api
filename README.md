# Simple Analytics API Ruby Gem
This is a simple wrapper to read the Simple Analytics API with Ruby.
It's based on the [API guide](https://docs.simpleanalytics.com/api/stats)

## Usage
Add this gem to your Gemfile:

```rb
gem 'simple_analytics_api'
```

Now you need to initialize a Client with your `api_key` (if the domain is not public), the `user_id` (required for some specific actions), and the `domain` you want to get stats from.

```rb
client = SimpleAnalyticsApi::Client.new(api_key: '<api_key>', user_id: '<user_id>', domain: '<domain>') 

# Test if the credentials are valid (all public domains should return true)
client.valid?
=> true
```

To get some actual data, you can use the `run` method, like this:
```rb
client.run(
  fields: %w(pageviews visitors pages), 
  filters: {
    start: '2021-01-01 00:00', 
    end: '2021-01-31 23:59'
  }
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dailytics/simpleanalytics_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/dailytics/simpleanalytics_api/blob/main/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SimpleAnalyticsApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dailytics/simpleanalytics_api/blob/main/CODE_OF_CONDUCT.md).
