class Wettr::IPAPI
  include HTTParty
  # debug_output STDOUT

  base_uri "https://ipapi.co"
  # https://ipapi.co/1.1.1.1/json

  def self.call_without_ip
    response = self.get("/json")
    
    if response["error"]
      puts "Encountered the following error with IPAPI.co:"
      puts response["reason"]
      puts response["message"]

      exit
    end

    response
  end

  private

  def self.call
    response = self.class.get("#{ip}/json")
  end
end