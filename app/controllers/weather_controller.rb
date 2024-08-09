# frozen_string_literal: true

# WeatherController manages weather-related actions and views.
class WeatherController < ApplicationController
  include WeatherHelper

  before_action :validate_city, only: [:show]
  before_action :load_prefecture_data, only: [:index]
  before_action :authenticate_user!
  after_action :verify_authorized, except: %i[index show]
  after_action :verify_policy_scoped, only: :index

  def index
    skip_policy_scope
    user_prefecture_id = current_user&.prefecture_id
    user_second_prefecture_id = current_user&.second_prefecture_id

    default_city = user_prefecture_id.present? ? Prefecture.find(user_prefecture_id).name : 'Tokyo'
    second_city = user_second_prefecture_id.present? ? Prefecture.find(user_second_prefecture_id).name : 'Osaka'

    @weather_data = fetch_weather_api_data(default_city)
    @second_weather_data = fetch_weather_api_data(second_city)

    flash.now[:alert] = '天気情報の取得に失敗しました。' unless @weather_data || @second_weather_data
  end

  def show
    @weather_data = fetch_weather_service_data(params[:city] || default_city)

    if @weather_data
      process_weather_data(@weather_data, params[:city] || default_city)
    else
      flash[:alert] = I18n.t('weather.fetch_failed')
      redirect_to action: :index
    end
  end

  def map
    authorize :weather, :map?
    @weather_data = fetch_weather_for_prefectures
    flash_part_weather_fetch_warning if weather_fetch_failed?
  end

  private

  def validate_city
    redirect_to(action: :index, alert: I18n.t('weather.enter_city')) if params[:city].blank?
  end

  def load_prefecture_data
    csv_path = Rails.root.join('prefectures.csv')
    @prefecture_data = CSV.read(csv_path, headers: true).map { |row| [row['prefecture'], row['english']] }
  end

  def fetch_weather_data_for_user(user)
    default_city = fetch_city_name(user&.prefecture_id, 'Tokyo')
    second_city = fetch_city_name(user&.second_prefecture_id, 'Osaka')

    {
      default_city: fetch_weather_api_data(default_city),
      second_city: fetch_weather_api_data(second_city)
    }
  end

  def fetch_city_name(prefecture_id, default_city)
    prefecture_id.present? ? Prefecture.find(prefecture_id).name : default_city
  end

  def flash_weather_fetch_warning
    flash.now[:alert] = I18n.t('weather.fetch_failed')
  end

  def fetch_weather_service_data(city)
    response = WeatherService.new(city).fetch_weather
    response.success? ? response.parsed_response : nil
  end

  def fetch_weather_api_data(city_name)
    api_key = Rails.application.credentials.dig(:openweathermap, :api_key)
    response = HTTParty.get('https://api.openweathermap.org/data/2.5/forecast',
                            query: { q: city_name, appid: api_key, units: 'metric', lang: 'ja' })
    return response.parsed_response if response.success?

    nil
  end

  def process_weather_data(weather_data, city)
    rainfall = fetch_rainfall(weather_data)
    @weather = build_weather_data(weather_data, rainfall)
    fetch_and_update_weather_forecast(city)
    send_rainfall_notification(rainfall) if rainfall.positive?
  end

  def fetch_and_update_weather_forecast(city)
    response_forecast = WeatherService.new(city).fetch_weather_forecast
    @weather_data = response_forecast.parsed_response if response_forecast.success?
  end

  def fetch_rainfall(weather_data)
    weather_data.dig('rain', '1h') || weather_data.dig('rain', '3h') || 0
  end

  def send_rainfall_notification(rainfall)
    send_line_notification(I18n.t('weather.rainfall_alert', city: @weather[:name])) if rainfall.positive?
  end

  def fetch_weather_for_prefectures
    prefecture_ids = [1, 4, 13, 23, 15, 26, 34, 39, 40, 46, 47]
    Prefecture.where(id: prefecture_ids).map do |prefecture|
      fetch_prefecture_weather(prefecture)
    end
  end

  def fetch_prefecture_weather(prefecture)
    weather = fetch_weather_api_data(prefecture.name)
    forecasts = select_forecasts(weather)
    { name: prefecture.name, weather:, forecasts: }
  end

  def select_forecasts(weather)
    return [] unless weather.present? && weather['list'].present?

    weather['list'].select do |forecast|
      forecast_within_24_hours?(forecast['dt'])
    end
  end

  def forecast_within_24_hours?(timestamp)
    Time.zone.at(timestamp) <= 24.hours.from_now
  end

  def weather_fetch_failed?
    @weather_data.any? { |data| data[:weather].nil? }
  end

  def flash_part_weather_fetch_warning
    flash.now[:alert] = I18n.t('weather.partial_fetch_failed')
  end
end
