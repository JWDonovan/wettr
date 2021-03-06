class Wettr::CLI
  attr_reader :args

  def initialize(args = nil)
    @args = args
  end

  def run
    if !args.empty?
      parse_args
    else
      ip = Wettr::IP.new_without_ip
      weather = Wettr::Weather.new_with_lat_and_lon(lat: ip.lat, lon: ip.lon)
      weather.print
    end
  end

  def parse_args
    if args.include?("--help")
      print_help_menu
    elsif args.include?("--version")
      puts "wettr #{Wettr::VERSION}"
    elsif zip = args[args.index("--zip") + 1]
      weather = Wettr::Weather.new_with_zip(zip)
      weather.print
    else
      puts "Please enter a zip code"
    end
  end

  def print_help_menu
    help_text = <<-HELP_TEXT
    Usage:
      wettr [options]
    \nOptions:
      --help                           # Print this menu
      --version                        # Print the version number
      --zip ZIP_CODE                   # Weather by zip/postal code
    \nDescription:
      wettr is a command line ruby gem to get current weather information
      using OpenWeatherMap's Current Weather API in conjunction with the
      ipapi.co IP address api.
    \n  wettr can get current weather data using either a zip/postal code
      or an IP address. Simply type wettr to get started.
    \nExamples:
      wettr                            # Weather by current IP address location
      wettr --zip 10001                # Weather by zip/postal code for New York City
      wettr --zip 20001                # Weather by zip/postal code for Washington D.C.
    HELP_TEXT
    
    puts help_text
  end
end