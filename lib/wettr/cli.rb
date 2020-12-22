class Wettr::CLI
  attr_reader :args

  def initialize(args = nil)
    @args = args
  end

  def call
    # response = Wettr::API.new.call_by_zip_code(zip_code: 43230, country_code: "gb")
    # puts response
    if !args.empty?
      parse_args
    else
      puts "Please enter a zip code"
    end
  end

  def parse_args
    if args.include?("--help")
      print_help_menu
    elsif args.include?("--version")
      puts "wettr #{Wettr::VERSION}"
    elsif zip = args[args.index("--zip") + 1]
      response = Wettr::API.new.call_by_zip_code(zip)
      response.print
    else
      puts "Please enter a zip code"
    end
  end

  def print_help_menu
    puts "Help menu"
  end
end