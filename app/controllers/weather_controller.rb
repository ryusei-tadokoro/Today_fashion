# gem httpartyを読み込む
require 'httparty'
# URIモジュールを読み込む（URLのエンコードや解析に使われる）
require 'uri'

class WeatherController < ApplicationController
  before_action :validate_city, only: [:show]
  before_action :load_prefecture_data, only: [:index]

  def index
    # デフォルトの都市を東京に設定
    default_city = 'Tokyo'

    # WeatherServiceのインスタンスを生成し、fetch_weatherメソッドを呼び出して天気情報を取得
    response = WeatherService.new(default_city).fetch_weather

    # HTTPレスポンスが成功かどうかをチェック
    if response.success?
      # HTTParty からのレスポンスをパースして、Rubyのハッシュ形式のデータ構造（weather_data）に変換
      weather_data = response.parsed_response
      @default_weather = {
        # ... (必要な情報を追加)

        # 都市名（東京都新宿区）
        name: "#{weather_data['name']} #{weather_data['sys']['country']}",
        # 現在の温度
        temp_celsius: kelvin_to_celsius(weather_data['main']['temp']).round(2),
        # 最高気温
        temp_max_celsius: kelvin_to_celsius(weather_data['main']['temp_max']).round(2),
        # 最低気温
        temp_min_celsius: kelvin_to_celsius(weather_data['main']['temp_min']).round(2),
        # 湿度
        humidity: weather_data['main']['humidity'],
        # 降水確率（APIには降水確率の直接の情報が含まれていない場合もあります）
        precipitation_probability: weather_data.dig('rain', '1h') || 'N/A',
        # 風速
        wind_speed: weather_data['wind']['speed'],
        # 天気
        description: weather_data['weather'][0]['description'],
        # 今日のひとこと（適切な情報がAPIに含まれていれば使用）
        today_message: 'デフォルトの天気情報です。'
      }
    else
      # 失敗した場合はエラーメッセージを表示
      flash.now[:alert] = "天気情報の取得に失敗しました。"
    end
  end

  def show
    # WeatherServiceのインスタンスを生成し、fetch_weatherメソッドを呼び出して天気情報を取得
    response = WeatherService.new(params[:city]).fetch_weather
    # HTTPレスポンスが成功かどうかをチェック
    if response.success?
      # HTTParty からのレスポンスをパースして、Rubyのハッシュ形式のデータ構造（weather_data）に変換
      weather_data = response.parsed_response
      @weather = {
        # 取得したweather_dataハッシュから特定の気象データを取り出し、適切な形式に変換
        # 都市の天気
        name: weather_data["name"],
        # 現在の温度
        temp_celsius: kelvin_to_celsius(weather_data["main"]["temp"]).round(2),
        # 体感温度
        feels_like_celsius: kelvin_to_celsius(weather_data["main"]["feels_like"]).round(2),
        # 最低気温
        temp_min_celsius: kelvin_to_celsius(weather_data["main"]["temp_min"]).round(2),
        # 最高気温
        temp_max_celsius: kelvin_to_celsius(weather_data["main"]["temp_max"]).round(2),
        # 湿度
        humidity: weather_data["main"]["humidity"],
        # 風速
        wind_speed: weather_data["wind"]["speed"],
        # 天気
        description: weather_data["weather"][0]["description"]
      }
    else
      # 成功でない場合、ユーザーをindexアクションにリダイレクトし、エラーメッセージを表示
      redirect_to action: :index, alert: "天気情報の取得に失敗しました。"
    end
  end

  private

  def validate_city
    # 都市名が空であれば、ユーザーをindexアクションにリダイレクトし、警告メッセージを表示
    redirect_to(action: :index, alert: "都市名を入力してください。") if params[:city].blank?
  end

  def load_prefecture_data
    csv_path = Rails.root.join('prefectures.csv')
    @prefecture_data = CSV.read(csv_path, headers: true).map { |row| [row['prefecture'], row['english']] }
  end

  def fetch_weather_by_city_id(city_id)
    WeatherService.new(city_id, use_city_id: true).fetch_weather
  end


  # ケルビン単位の温度を摂氏単位に変換するkelvin_to_celsiusメソッドを定義
  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end
end

class WeatherService
  # HTTPartyモジュールをWeatherServiceクラスにインクルード
  include HTTParty
  # OpenWeatherMap APIのベースURIを設定
  base_uri 'api.openweathermap.org'

  def initialize(city)
    # 環境変数からOpenWeatherMapのAPIキーを取得
    api_key = ENV['OPENWEATHERMAP_API_KEY']
    # APIリクエストのためのオプションを設定
    if use_city_id
      @options = { query: { id: city, appid: api_key, lang: 'ja' } }
    else
      @options = { query: { q: "#{city},jp", appid: api_key, lang: 'ja' } }
    end
  end

  def fetch_weather
    # HTTPartyによって提供されるgetメソッドをクラスメソッドとして呼び出す
    self.class.get("/data/2.5/weather", @options)
  end
end