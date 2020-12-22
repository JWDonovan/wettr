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
    if args.include?("--zip")
      zip = args[args.index("--zip") + 1]
      response = Wettr::API.new.call_by_zip_code(zip)
      response.print
    end
  end
end