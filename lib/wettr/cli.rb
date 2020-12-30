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
    puts "Help menu"
  end
end