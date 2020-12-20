class Wettr::API
  include HTTParty
  debug_output STDOUT

  base_uri "https://api.openweathermap.org"
  default_params appid: ENV["API_KEY"]

  def call
    response = self.class.get("/data/2.5/weather", @options)
    # puts response.request.last_uri.to_s
    response
  end

  def call_by_city_name(city_name:, units: "imperial")
    @options = { query: { q: city_name, units: units } }
    call
  end

  def call_by_city_id(city_id:, units: "imperial")
    @options = { query: { id: city_id, units: units } }
    call
  end

  def call_by_lat_and_lon(lat:, lon:, units: "imperial")
    @options = { query: { lat: lat, lon: lon, units: units } }
    call
  end

  def call_by_zip_code(zip_code:, country_code: "us", units: "imperial")
    @options = { query: { zip: "#{zip_code},#{country_code}", units: units } }
    call
  end
end