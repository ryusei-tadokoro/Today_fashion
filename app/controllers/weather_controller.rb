# gem httpartyを読み込む
require 'httparty'
# URIモジュールを読み込む（URLのエンコードや解析に使われる）
require 'uri'

class WeatherController < ApplicationController
  before_action :validate_city, only: [:show]

  def index
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
        name: weather_data["name"],
        temp_celsius: kelvin_to_celsius(weather_data["main"]["temp"]).round(2),
        feels_like_celsius: kelvin_to_celsius(weather_data["main"]["feels_like"]).round(2),
        temp_min_celsius: kelvin_to_celsius(weather_data["main"]["temp_min"]).round(2),
        temp_max_celsius: kelvin_to_celsius(weather_data["main"]["temp_max"]).round(2),
        humidity: weather_data["main"]["humidity"],
        wind_speed: weather_data["wind"]["speed"],
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
    @options = { query: { q: "#{city},jp", appid: api_key, lang: 'ja' } }
  end

  def fetch_weather
    # HTTPartyによって提供されるgetメソッドをクラスメソッドとして呼び出す
    self.class.get("/data/2.5/weather", @options)
  end
end
