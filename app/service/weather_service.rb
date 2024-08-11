# frozen_string_literal: true

# app/services/weather_service.rb
class WeatherService
  include HTTParty
  base_uri 'api.openweathermap.org'

  def initialize(city)
    credentials = Rails.application.credentials
    @api_key = credentials.dig(:openweathermap, :api_key)
    @options = { query: { q: "#{city},jp", appid: @api_key, lang: 'ja' } }
  end

  def fetch_weather
    self.class.get('/data/2.5/weather', @options)
  end

  def fetch_weather_forecast
    response = self.class.get('/data/2.5/forecast', @options)
    update_forecast_temperatures(response.parsed_response) if response.success?
    response
  end

  private

  def update_forecast_temperatures(weather_forecast_data)
    weather_forecast_data['list'].each do |forecast|
      update_forecast_temperature(forecast['main'])
    end
  end

  def update_forecast_temperature(main)
    main['temp'] = kelvin_to_celsius(main['temp']).round(1)
    main['feels_like'] = kelvin_to_celsius(main['feels_like']).round(1)
    main['temp_min'] = kelvin_to_celsius(main['temp_min']).round(1)
    main['temp_max'] = kelvin_to_celsius(main['temp_max']).round(1)
  end

  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end
end
