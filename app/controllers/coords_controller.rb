require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    @latitude = 37.4219988
    @longitude = -122.083954
    your_api_key = "7aed3b73c48cca63671473e41fac875d"


    url = "https://api.forecast.io/forecast/7aed3b73c48cca63671473e41fac875d/37.421998,-122.083954"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]

  end
end
