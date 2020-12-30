class Wettr::IP
  attr_reader :address, :lat, :lon

  def initialize(address:, lat:, lon:)
    @address, @lat, @lon = address, lat, lon
  end

  def self.new_without_ip
    response = Wettr::IPAPI.call_without_ip
    ip = self.new(address: response["ip"], lat: response["latitude"], lon: response["longitude"])
    ip
  end
end