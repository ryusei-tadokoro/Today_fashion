require 'csv'

class WeatherController < ApplicationController
  before_action :load_prefecture_data, only: [:index, :show]

  def index
  end

  def show
    # フォームからの入力を取得
    selected_prefecture = params[:city]
    
    # 選択された都道府県の天気情報を取得
    @weather_forecast = WeatherInfo.new(@prefecture_data).get_weather_forecast(selected_prefecture)

  end

  private

  def load_prefecture_data
    csv_path = Rails.root.join('prefectures.csv')
    @prefecture_data = CSV.read(csv_path, headers: true).map { |row| [row['prefecture'], row['english']] }
  end
end