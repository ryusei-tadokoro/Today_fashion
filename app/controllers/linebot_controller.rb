require 'line/bot'

class LinebotController < ApplicationController
  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery except: [:callback]

  # LINE Clientの初期化
  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV.fetch('LINE_CHANNEL_SECRET', nil)
      config.channel_token = ENV.fetch('LINE_CHANNEL_TOKEN', nil)
    end
  end

  # LINEからのコールバックを処理するアクション
  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    return head :bad_request unless client.validate_signature(body, signature)

    events = client.parse_events_from(body)

    events.each do |event|
      user_id = event['source']['userId']
      user = User.find_by(uid: user_id)

      if user.nil?
      else
        case event
        when Line::Bot::Event::Message
          case event.type
          when Line::Bot::Event::MessageType::Text
            message_text = event.message['text']
            message = case message_text
                      when /天気予報/
                        fetch_weather_forecast_message(user)
                      else
                        { type: 'text', text: "申し訳ありません。'#{message_text}'に対する応答を用意していません。" }
                      end
            client.reply_message(event['replyToken'], message)
          end
        end
      end
    end

    head :ok
  end

  def fetch_weather_data(city)
    response = WeatherService.new(city).fetch_weather
    response.success? ? response.parsed_response : nil
  end

  private

  # ユーザーの登録都市の天気予報を取得し、メッセージを生成するメソッド
  def fetch_weather_forecast_message(user)
    default_city = user.prefecture_id.present? ? Prefecture.find(user.prefecture_id).name : 'Tokyo'
    weather_data = fetch_weather_data(default_city)

    if weather_data.present?
      temp_max = kelvin_to_celsius(weather_data['main']['temp_max']).round(1)
      temp_min = kelvin_to_celsius(weather_data['main']['temp_min']).round(1)
      humidity = weather_data['main']['humidity']
      wind_speed = weather_data['wind']['speed']
      description = weather_data['weather'][0]['description']
      icon_url = "https://openweathermap.org/img/wn/#{weather_data['weather'][0]['icon']}@2x.png"

      message = {
        type: 'flex',
        altText: "#{default_city}の天気予報",
        contents: {
          type: 'bubble',
          body: {
            type: 'box',
            layout: 'vertical',
            contents: [
              {
                type: 'text',
                text: "#{default_city}の天気予報",
                weight: 'bold',
                size: 'xl'
              },
              {
                type: 'box',
                layout: 'vertical',
                margin: 'lg',
                spacing: 'sm',
                contents: [
                  {
                    type: 'box',
                    layout: 'baseline',
                    spacing: 'sm',
                    contents: [
                      {
                        type: 'text',
                        text: '気温',
                        color: '#aaaaaa',
                        size: 'sm',
                        flex: 1
                      },
                      {
                        type: 'text',
                        text: "#{temp_max} - #{temp_min} °C",
                        wrap: true,
                        color: '#666666',
                        size: 'sm',
                        flex: 5
                      }
                    ]
                  },
                  {
                    type: 'box',
                    layout: 'baseline',
                    spacing: 'sm',
                    contents: [
                      {
                        type: 'text',
                        text: '湿度',
                        color: '#aaaaaa',
                        size: 'sm',
                        flex: 1
                      },
                      {
                        type: 'text',
                        text: "#{humidity} %",
                        wrap: true,
                        color: '#666666',
                        size: 'sm',
                        flex: 5
                      }
                    ]
                  },
                  {
                    type: 'box',
                    layout: 'baseline',
                    spacing: 'sm',
                    contents: [
                      {
                        type: 'text',
                        text: '風速',
                        color: '#aaaaaa',
                        size: 'sm',
                        flex: 1
                      },
                      {
                        type: 'text',
                        text: "#{wind_speed} m/s",
                        wrap: true,
                        color: '#666666',
                        size: 'sm',
                        flex: 5
                      }
                    ]
                  },
                  {
                    type: 'box',
                    layout: 'baseline',
                    spacing: 'sm',
                    contents: [
                      {
                        type: 'text',
                        text: '天気',
                        color: '#aaaaaa',
                        size: 'sm',
                        flex: 1
                      },
                      {
                        type: 'text',
                        text: description,
                        wrap: true,
                        color: '#666666',
                        size: 'sm',
                        flex: 5
                      }
                    ]
                  },
                  {
                    type: 'image',
                    url: icon_url,
                    size: 'md',
                    aspectRatio: '1:1'
                  }
                ]
              }
            ]
          }
        }
      }
    else
      message = {
        type: 'text',
        text: "#{default_city}の天気情報が取得できませんでした。"
      }
    end

    message
  rescue StandardError => e
    Rails.logger.error "Error fetching weather forecast: #{e.message}"
    Rails.logger.error e.backtrace.join("\n")
    {
      type: 'text',
      text: '天気予報の取得に失敗しました。'
    }
  end
end
