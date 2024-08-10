# frozen_string_literal: true

require 'line/bot'

class PushLineJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    User.find_each do |user|
      cities = fetch_user_cities(user)
      cities.each do |city|
        weather_data = fetch_weather_data(city)
        send_rainfall_notification(user, city, weather_data) if weather_data
      end
    end
  end

  private

  def fetch_user_cities(user)
    default_city = user.prefecture_id? ? Prefecture.find(user.prefecture_id).name : 'Tokyo'
    second_city = user.second_prefecture_id? ? Prefecture.find(user.second_prefecture_id).name : 'Osaka'
    [default_city, second_city]
  end

  def send_rainfall_notification(user, city, weather_data)
    rainfall = fetch_rainfall(weather_data)
    return unless rainfall.positive?

    message = "【#{city}】に降水が予測されています。傘をお持ちください。"
    send_line_notification(user.uid, message)
  end

  def fetch_rainfall(weather_data)
    weather_data.dig('rain', '1h') || weather_data.dig('rain', '3h') || 0
  end

  def fetch_weather_data(city)
    response = WeatherService.new(city).fetch_weather
    response.success? ? response.parsed_response : nil
  end

  def send_line_notification(user_id, message)
    response = line_client.push_message(user_id, { type: 'text', text: message })
    logger.info "Line Notification Sent: #{response}" if response
  end

  def line_client
    @line_client ||= Line::Bot::Client.new do |config|
      credentials = Rails.application.credentials
      config.channel_secret = credentials.dig(:line, :channel_secret)
      config.channel_token = credentials.dig(:line, :channel_token)
    end
  end
end
