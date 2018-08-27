# LocationService

This gem interfaces with the FedEx Location Services API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fedex_location_service'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fedex_location_service

## Usage

In order to use the FedEx API you will need to sign up for a FedEx Webservices account and receive your own test and production credentials.

These credentials can be configured by using the following configuration block:

```ruby
FedexLocationService.configure do |c|
  c.wsdl           = 'WSDL URL'
  c.key            = 'KEY'
  c.password       = 'PASSWORD'
  c.account_number = 'ACCOUNT NUMBER'
  c.meter_number   = 'METER NUMBER'
end
```

In order to build a message to pass to the FedEx API you will need to create an address object that resonds to the following:

address_one
address_two
city
state
postal_code

This can be done with a Struct or with active_record address model. This can then be passed to FedexLocationService::Message.build() to generate the proper SOAP message.

Example:

```ruby
Address = Struct.new(:address_one, :address_two, :city, :state, :postal_code)

addr = Address.new('6008 W Broad St.', nil, 'Richmond', 'VA', '23230')

message = FedexLocationService::Message.build(addr)
```

The resulting message can then be passed to FedexLocationService::Request.call().

This will return a Savon object that you can parse.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/odin/location_service.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
