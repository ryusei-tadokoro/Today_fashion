# frozen_string_literal: true

require 'line/bot'
require 'weather_message_builder'

# LinebotController handles interactions with the LINE messaging API.
# It processes incoming messages and sends appropriate responses.
class LinebotController < ApplicationController
  include WeatherMessageBuilder

  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery except: [:callback]

  # LINE Clientの初期化
  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = Rails.application.credentials.line[:channel_secret]
      config.channel_token = Rails.application.credentials.line[:channel_token]
    end
  end

  # LINEからのコールバックを処理するアクション
  def callback
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    return head :bad_request unless client.validate_signature(body, signature)

    events = client.parse_events_from(body)
    events.each { |event| handle_event(event) }

    head :ok
  end

  private

  def handle_event(event)
    user_id = event['source']['userId']
    user = User.find_by(uid: user_id)
    return if user.nil?

    case event
    when Line::Bot::Event::Message
      handle_message_event(event, user)
    end
  end

  def handle_message_event(event, user)
    return unless event.type == Line::Bot::Event::MessageType::Text

    message_text = event.message['text']
    message = case message_text
              when /天気予報/
                fetch_weather_forecast_message(user)
              else
                { type: 'text', text: "申し訳ありません。'#{message_text}'に対する応答を用意していません。" }
              end
    client.reply_message(event['replyToken'], message)
  end

  def fetch_weather_data(city)
    response = WeatherService.new(city).fetch_weather
    response.success? ? response.parsed_response : nil
  end

  def fetch_weather_forecast_message(user)
    default_city = user.prefecture_id.present? ? Prefecture.find(user.prefecture_id).name : 'Tokyo'
    weather_data = fetch_weather_data(default_city)

    weather_data.present? ? build_weather_message(default_city, weather_data) : weather_error_message(default_city)
  rescue StandardError => e
    log_weather_error(e)
    { type: 'text', text: '天気予報の取得に失敗しました。' }
  end

  def weather_error_message(default_city)
    { type: 'text', text: "#{default_city}の天気情報が取得できませんでした。" }
  end

  def log_weather_error(error)
    Rails.logger.error "Error fetching weather forecast: #{error.message}"
    Rails.logger.error error.backtrace.join("\n")
  end

  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end
end
