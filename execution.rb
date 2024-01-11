require "csv"
require_relative "weather_info"
require_relative "config"
require "json"
require "open-uri"
require "date"

prefectures = CSV.read("./prefectures.csv", headers: true)
weather_info = WeatherInfo.new(prefectures)
prefecture = weather_info.select_prefecture
datas = weather_info.get_weather_forecast(prefecture)
weather_info.display_weather_forecast(datas)