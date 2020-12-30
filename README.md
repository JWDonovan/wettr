# Wettr

wettr (ˈvɛtɐ, From the German word 'Wetter' meaning weather) is a command line ruby gem to get current weather information using OpenWeatherMap's Current Weather API in conjunction with the ipapi.co IP address API.

wettr can get current weather data using either a zip/postal code or an IP address. Once installed, simply type `wettr` to get started.

## Installation

    $ gem install wettr

## Usage

wettr does not need to be invoked with any parameters to work. Simply type `wettr` and you will get current weather information based on your public IP address.
Below are some examples of the way wettr can be used:
```bash
wettr
# prints the current weather at your current IP address location
wettr --zip ZIP_CODE
# prints the current weather at the given zip code
wettr --version
# outputs 'wettr 0.1.0'
```

To see more usage info, enter `wettr --help`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

wettr requires an API key for OpenWeatherMap's Current Weather API.
To get a key sign up for an account on [their website](https://home.openweathermap.org/users/sign_up).
Once you have a key, create a `.env` file in the project's root directory.
Add the following line to the `.env` file:

```bash
API_KEY=<YOUR_API_KEY_HERE>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JWDonovan/wettr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/JWDonovan/wettr/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Wettr project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/JWDonovan/wettr/blob/master/CODE_OF_CONDUCT.md).
