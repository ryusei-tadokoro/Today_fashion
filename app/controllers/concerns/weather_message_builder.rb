# frozen_string_literal: true

# WeatherMessageBuilder is a module that provides methods to build weather messages
# for the LINE bot. It constructs the message based on weather data.
module WeatherMessageBuilder
  def build_weather_message(default_city, weather_data)
    {
      type: 'flex',
      altText: "#{default_city}の天気予報",
      contents: build_message_contents(default_city, weather_data)
    }
  end

  private

  def build_message_contents(default_city, weather_data)
    {
      type: 'bubble', body: {
        type: 'box', layout: 'vertical', contents: [
          { type: 'text', text: "#{default_city}の天気予報", weight: 'bold', size: 'xl' },
          { type: 'box', layout: 'vertical', margin: 'lg', spacing: 'sm',
            contents: weather_contents(extract_weather_params(weather_data)) }
        ]
      }
    }
  end

  def extract_weather_params(weather_data)
    {
      temp_max: extract_temp_max(weather_data),
      temp_min: extract_temp_min(weather_data),
      humidity: weather_data['main']['humidity'],
      wind_speed: weather_data['wind']['speed'],
      description: weather_data['weather'][0]['description'],
      icon_url: build_icon_url(weather_data)
    }
  end

  def extract_temp_max(weather_data)
    kelvin_to_celsius(weather_data['main']['temp_max']).round(1)
  end

  def extract_temp_min(weather_data)
    kelvin_to_celsius(weather_data['main']['temp_min']).round(1)
  end

  def build_icon_url(weather_data)
    "https://openweathermap.org/img/wn/#{weather_data['weather'][0]['icon']}@2x.png"
  end

  def weather_contents(weather_params)
    [
      weather_content('気温', "#{weather_params[:temp_max]} ℃ / #{weather_params[:temp_min]} °C"),
      weather_content('湿度', "#{weather_params[:humidity]} %"),
      weather_content('風速', "#{weather_params[:wind_speed]} m/s"),
      weather_content('天気', weather_params[:description]),
      { type: 'image', url: weather_params[:icon_url], size: 'md', aspectRatio: '1:1' }
    ]
  end

  def weather_content(label, value)
    {
      type: 'box',
      layout: 'baseline',
      spacing: 'sm',
      contents: [
        { type: 'text', text: label, color: '#aaaaaa', size: 'sm', flex: 1 },
        { type: 'text', text: value, wrap: true, color: '#666666', size: 'sm', flex: 5 }
      ]
    }
  end

  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end
end
