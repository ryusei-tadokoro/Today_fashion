require 'line/bot'

class LinebotController < ApplicationController
  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery except: [:callback]

  # LINE Clientの初期化
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  # LINEからのコールバックを処理するアクション
  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      return head :bad_request
    end

    events = client.parse_events_from(body)

    events.each do |event|
      user_id = event['source']['userId']
      user = User.find_by(uid: user_id)

      if user.nil?
        # ユーザーが見つからない場合の処理（必要に応じて）
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

  private

  # ユーザーの登録都市の天気予報を取得し、メッセージを生成するメソッド
  def fetch_weather_forecast_message(user)
    # 仮にユーザーの都市名を取得するメソッドがあると仮定
    city = user.city_name

    # 天気予報を取得するロジック（API呼び出し等）
    forecast = WeatherService.new(city).fetch_weather_forecast

    # LINEで送信するメッセージの形式に合わせてメッセージを作成
    {
      type: 'text',
      text: "#{city}の天気予報: #{forecast}"
    }
  rescue => e
    # 天気予報取得時のエラー処理
    {
      type: 'text',
      text: "天気予報の取得に失敗しました。"
    }
  end
end
