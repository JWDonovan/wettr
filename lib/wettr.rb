require "dotenv/load"
Dotenv.require_keys("API_KEY")
require "httparty"

module Wettr
  class Error < StandardError; end
end

require_relative "./wettr/version"
require_relative "./wettr/cli"
require_relative "./wettr/weather"
require_relative "./wettr/weather_api"
require_relative "./wettr/ip_api"
require_relative "./wettr/ip"