# Home Automation

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/template`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'template'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install template

## Usage

TODO: Write usage instructions here

## Notes

### Documentation
* https://www.developers.meethue.com/documentation/getting-started

Get "username" (which is a long hex string) from the bridge using instructions above.

* Send the following HTTP requests to the ip address of the bridge

````
GET /api/username/lights
````

##### Discover IP address
https://discovery.meethue.com -> [{"id":"001788fffe71c27d","internalipaddress":"10.0.0.89"}]

### Tech Debt
* 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pitosalas/template.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
