# frozen_string_literal: true

require 'line/bot'

class PushLineJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    User.find_each do |user|
      # ユーザーのデフォルト都市とセカンド都市を取得
      default_city = user.prefecture_id? ? Prefecture.find(user.prefecture_id).name : 'Tokyo'
      second_city = user.second_prefecture_id? ? Prefecture.find(user.second_prefecture_id).name : 'Osaka'

      # 両都市の天気予報を取得し、必要に応じて通知を送信
      [default_city, second_city].each do |city|
        weather_data = fetch_weather_data(city)
        next unless weather_data

        rainfall = weather_data.dig('rain', '1h') || weather_data.dig('rain', '3h') || 0
        if rainfall.positive?
          message = "【#{city}】に降水が予測されています。傘をお持ちください。"
          send_line_notification(user.uid, message)
        end
      end
    end
  end

  private

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
      config.channel_secret = ENV.fetch('LINE_CHANNEL_SECRET', nil)
      config.channel_token = ENV.fetch('LINE_CHANNEL_TOKEN', nil)
    end
  end
end
