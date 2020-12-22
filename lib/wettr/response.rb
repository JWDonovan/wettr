class Wettr::Response
  def initialize(city_name, weather_desc, temp, temp_min, temp_max)
    @city_name = city_name
    @weather_desc = weather_desc
    @temp = temp
    @temp_min = temp_min
    @temp_max = temp_max
  end

  def self.new_from_api(response_hash)
    self.new(
      response_hash["name"],
      response_hash["weather"][0]["description"],
      response_hash["main"]["temp"],
      response_hash["main"]["temp_min"],
      response_hash["main"]["temp_max"]
    )
  end

  def print
    puts "Current Weather in #{@city_name}. #{@weather_desc.capitalize}. Temp: #{@temp}, Min. Temp: #{@temp_min}, Max. Temp: #{@temp_max}"
  end
end