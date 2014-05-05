require 'open-uri'
require 'json'

class CoordsController < ApplicationController

def fetch_weather

if @address = params[:address]

    @url_safe_address = URI.encode(@address)

    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    your_api_key = "7aed3b73c48cca63671473e41fac875d"

    url = "https://api.forecast.io/forecast/7aed3b73c48cca63671473e41fac875d/#{@latitude},#{@longitude}"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]

else

    @address != params[:address]

    @latitude = 37.8267
    @longitude = -122.423

    your_api_key = "7aed3b73c48cca63671473e41fac875d"

    url = "https://api.forecast.io/forecast/7aed3b73c48cca63671473e41fac875d/37.8267,-122.423"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]


  end
end
end

