class Wettr::WeatherAPI
  include HTTParty

  base_uri "https://api.openweathermap.org"

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
    default_params appid: Wettr::Config.API_KEY, units: "imperial"
    
    response = self.get("/data/2.5/weather", @options)

    if response["cod"] != 200
      puts "Encountered an error contacting OpenWeatherMap"
      puts "Returned the following response: #{ response['cod'] }"
      puts "Message: #{ response['message'] }"
      exit
    end

    response
  end
end