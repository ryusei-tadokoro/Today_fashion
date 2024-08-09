# app/helpers/weather_helper.rb

module WeatherHelper
  def build_weather_data(weather_data, rainfall)
    {
      name: extract_weather_name(weather_data),
      temp_celsius: extract_temperature(weather_data, 'temp'),
      feels_like_celsius: extract_temperature(weather_data, 'feels_like'),
      temp_min_celsius: extract_temperature(weather_data, 'temp_min'),
      temp_max_celsius: extract_temperature(weather_data, 'temp_max'),
      humidity: extract_humidity(weather_data),
      wind_speed: extract_wind_speed(weather_data),
      description: extract_description(weather_data),
      rainfall: 
    }
  end

  def extract_weather_name(weather_data)
    weather_data['name']
  end

  def extract_temperature(weather_data, key)
    kelvin_to_celsius(weather_data['main'][key]).round(1)
  end

  def extract_humidity(weather_data)
    weather_data['main']['humidity']
  end

  def extract_wind_speed(weather_data)
    weather_data['wind']['speed']
  end

  def extract_description(weather_data)
    weather_data['weather'][0]['description']
  end

  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end
end
