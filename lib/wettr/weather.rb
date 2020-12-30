class Wettr::Weather
  attr_reader :weather_description, :temp, :feels_like, :temp_min, :temp_max, :pressure, :humidity, :visibility, :wind_speed, :cloudiness, :time_calculated, :country_code, :sunrise_time, :sunset_time, :timezone, :city_id, :city_name

  def initialize(weather_description:, temp:, feels_like:, temp_min:, temp_max:, pressure:, humidity:, visibility:, wind_speed:, cloudiness:, time_calculated:, country_code:, sunrise_time:, sunset_time:, timezone:, city_id:, city_name:)
    @weather_description = weather_description
    @temp = temp
    @feels_like = feels_like
    @temp_min = temp_min
    @temp_max = temp_max
    @pressure = pressure
    @humidity = humidity
    @visibility = visibility
    @wind_speed = wind_speed
    @cloudiness = cloudiness
    @time_calculated = time_calculated
    @country_code = country_code
    @sunrise_time = sunrise_time
    @sunset_time = sunset_time
    @timezone = timezone
    @city_id = city_id
    @city_name = city_name
  end

  def self.new_with_lat_and_lon(lat:, lon:)
    response = Wettr::WeatherAPI.call_with_lat_and_lon(lat: lat, lon: lon)
    weather = self.new_from_api_response(response)
    weather
  end

  def self.new_with_zip(zip)
    response = Wettr::WeatherAPI.call_with_zip(zip)
    weather = self.new_from_api_response(response)
    weather
  end

  def print
    puts "Current weather for #{ @city_name.capitalize }, #{ @country_code }"
    puts "Description: #{ @weather_description.capitalize }"
    puts "#{ @temp }°F, Feels Like: #{ @feels_like }°F, Min. Temp: #{ @temp_min }°F, Max. Temp: #{ @temp_max }°F"
    puts "Pressure: #{ @pressure } hPa, Humidity: #{ @humidity }%"
    puts "Visibility: #{ @visibility.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse } Ft., Wind Speed: #{ @wind_speed } m/h, Cloudiness: #{ @cloudiness }%"
    puts "Sunrise: #{ Time.at(@sunrise_time).strftime("%k:%M") }, Sunset: #{ Time.at(@sunset_time).strftime("%k:%M") }"
    puts "Weather Last Calculated at #{ Time.at(@time_calculated).strftime("%k:%M") }"
  end

  private

  def self.new_from_api_response(response)
    weather = self.new(
      weather_description: response["weather"].first["description"],
      temp: response["main"]["temp"],
      feels_like: response["main"]["feels_like"],
      temp_min: response["main"]["temp_min"],
      temp_max: response["main"]["temp_max"],
      pressure: response["main"]["pressure"],
      humidity: response["main"]["humidity"],
      visibility: response["visibility"],
      wind_speed: response["wind"]["speed"],
      cloudiness: response["clouds"]["all"],
      time_calculated: response["dt"],
      country_code: response["sys"]["country"],
      sunrise_time: response["sys"]["sunrise"],
      sunset_time: response["sys"]["sunset"],
      timezone: response["timezone"],
      city_id: response["id"],
      city_name: response["name"]
    )

    weather
  end
end