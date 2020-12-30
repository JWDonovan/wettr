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
    puts "Usage:"
    puts "  wettr [options]"
    puts "\nOptions:"
    puts "  --help                       # Print this menu"
    puts "  --version                    # Print the version number"
    puts "  --zip ZIP_CODE               # Weather by zip/postal code"
    puts "\nDescription:"
    puts "  wettr is a command line ruby gem to get current weather information"
    puts "  using OpenWeatherMap's Current Weather API in conjunction with the" 
    puts "  IPAPI.co IP adress API."
    puts "\n  wettr can get current weather data using either a zip/postal code"
    puts "  or an IP address. Simply type wettr to get started."
    puts "\nExamples:"
    puts "  wettr                        # Weather by current IP address location"
    puts "  wettr --zip 10001            # Weather by zip/postal code for New York City"
    puts "  wettr --zip 20001            # Weather by zip/postal code for Washington D.C."
  end
end