class Wettr::Config
  @@API_KEY = nil
  @@config_hash = {}

  def self.start
    self.read_config_file
    self.set_api_key
  end

  def self.API_KEY
    @@API_KEY
  end

  private
  
  def self.set_api_key
    if @@config_hash["API_KEY"]
      @@API_KEY = @@config_hash["API_KEY"]
    else
      puts "Cannot find API_KEY in .wettr.yml"
      puts "An OpenWeatherMap Current Weather API key is required to use wettr"
      puts "Create an account here to sign up for a key: https://home.openweathermap.org/users/sign_up"
      puts "See https://github.com/JWDonovan/wettr for more info"
      exit
    end
  end

  def self.read_config_file
    begin
      @@config_hash = YAML.load(File.read(ENV["HOME"] + "/.wettr.yml")) || {}
    rescue Errno::ENOENT => exception
      puts "Cannot find the wettr config file"
      puts "Please create a .wettr.yml config file in your home directory in order to use wettr"
      puts "See https://github.com/JWDonovan/wettr for more info"
      exit
    end
  end
end