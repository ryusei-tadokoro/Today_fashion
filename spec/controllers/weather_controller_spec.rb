require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    sign_in @user
    allow(controller).to receive(:current_user).and_return(@user)
  end

  describe 'GET #index' do
    context 'when weather data cannot be fetched' do
      before do
        allow_any_instance_of(WeatherController).to receive(:fetch_weather_api_data).and_return(nil)
        get :index
      end

      it 'sets the flash alert' do
        expect(flash[:alert]).to eq('天気情報の取得に失敗しました。')
      end
    end

    context 'when weather data is fetched successfully' do
      before do
        weather_data = { 'list' => [] }
        allow_any_instance_of(WeatherController).to receive(:fetch_weather_api_data).and_return(weather_data)
        get :index
      end

      it 'does not set the flash alert' do
        expect(flash[:alert]).to be_nil
      end
    end
  end

  describe 'GET #show' do
    context 'when city is valid' do
      before do
        allow_any_instance_of(WeatherController).to receive(:fetch_weather_service_data).and_return('name' => 'Tokyo',
                                                                                                    'main' => { 'temp' => 300.15, 'feels_like' => 298.15, 'temp_min' => 299.15, 'temp_max' => 301.15, 'humidity' => 80 }, 'wind' => { 'speed' => 5 }, 'weather' => [{ 'description' => 'clear sky' }])
        get :show, params: { city: 'Tokyo' }
      end

      it 'fetches weather data' do
        expect(assigns(:weather_data)).not_to be_nil
      end

      it 'does not set the flash alert' do
        expect(flash[:alert]).to be_nil
      end
    end

    context 'when city is invalid' do
      before do
        allow_any_instance_of(WeatherController).to receive(:fetch_weather_service_data).and_return(nil)
        get :show, params: { city: 'InvalidCity' }
      end

      it 'sets the flash alert and redirects to index' do
        expect(flash[:alert]).to eq('天気情報の取得に失敗しました。')
        expect(response).to redirect_to(action: :index)
      end
    end
  end

  describe 'GET #map' do
    context 'when weather data is fetched successfully' do
      before do
        weather_data = { 'list' => [] }
        allow_any_instance_of(WeatherController).to receive(:fetch_weather_api_data).and_return(weather_data)
        get :map
      end

      it 'does not set the flash alert' do
        expect(flash[:alert]).to be_nil
      end
    end

    context 'when some weather data cannot be fetched' do
      before do
        allow_any_instance_of(WeatherController).to receive(:fetch_weather_api_data).and_return(nil)
        get :map
      end

      it 'sets the flash alert' do
        expect(flash[:alert]).to eq('一部の天気情報の取得に失敗しました。')
      end
    end
  end
end
