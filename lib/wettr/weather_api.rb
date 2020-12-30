class Wettr::WeatherAPI
  include HTTParty
  # debug_output STDOUT

  base_uri "https://api.openweathermap.org"
  default_params appid: ENV["API_KEY"], units: "imperial"

  def self.call_with_lat_and_lon(lat:, lon:)
    @options = { query: { lat: lat, lon: lon } }
    call
  end

  def self.call_with_zip(zip)
    @options = { query: { zip: zip } }
    call
  end

  private
  
  def self.call
    response = self.get("/data/2.5/weather", @options)
    response
  end
end