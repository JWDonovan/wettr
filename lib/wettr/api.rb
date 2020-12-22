class Wettr::API
  include HTTParty
  debug_output STDOUT

  base_uri "https://api.openweathermap.org"
  default_params appid: ENV["API_KEY"], units: "imperial"

  def call
    response = Wettr::Response.new_from_api(self.class.get("/data/2.5/weather", @options))
    # puts response.request.last_uri.to_s
  end

  def call_by_zip_code(zip_code)
    @options = { query: { zip: zip_code } }
    call
  end
end