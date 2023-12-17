Hanami::Cucumber
===

Cucumber and testing support for [Hanami applications](https://github.com/hanami/hanami).

> [!WARNING]
> This gem still under development and not stable for now.

## Status

[![CI](https://github.com/elct9620/hanami-cucumber/actions/workflows/main.yml/badge.svg)](https://github.com/elct9620/hanami-cucumber/actions/workflows/main.yml)

## Rubies

**Hanami::Cucumber** supports Ruby (MRI) 3.0+

## Installation

Add this line to your application's Gemfile:

```ruby
group :cli, :development, :test do
  gem "hanami-cucumber"
end
```

And then execute:

```
$ bundle install
$ bundle exec hanami setup
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/elct9620/hanami-cucumber. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/elct9620/hanami-cucumber/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the `Hanami::RSpec` project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/elct9620/hanami-cucumber/blob/main/CODE_OF_CONDUCT.md).

## Copyright

Copyright © 2023 ZhengXian Qiu – Released under MIT License
