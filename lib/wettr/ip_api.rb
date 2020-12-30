class Wettr::IPAPI
  include HTTParty
  # debug_output STDOUT

  base_uri "https://ipapi.co"
  # https://ipapi.co/1.1.1.1/json

  def self.call_without_ip
    response = self.get("/json")
    response
  end

  private

  def self.call
    response = self.class.get("#{ip}/json")
  end
end