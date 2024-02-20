require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe "GET #index" do
    context "when user is logged in" do
      before do
        # ログインユーザーのモックを作成（必要に応じて調整してください）
        @user = FactoryBot.create(:user)
        sign_in @user
      end

      it "assigns weather data for default and second city" do
        # WeatherServiceのモックを作成して、期待される応答を返すように設定
        allow_any_instance_of(WeatherService).to receive(:fetch_weather).and_return(instance_double("HTTParty::Response", success?: true, parsed_response: {"some" => "data"}))

        get :index

        expect(assigns(:weather_data)).to_not be_nil
        expect(assigns(:second_weather_data)).to_not be_nil
      end

      it "shows alert when weather data cannot be fetched" do
        allow_any_instance_of(WeatherService).to receive(:fetch_weather).and_return(instance_double("HTTParty::Response", success?: false))

        get :index

        expect(flash[:alert]).to eq('天気情報の取得に失敗しました。')
      end
    end
  end

  describe "GET #show" do
    it "redirects when city is not provided" do
        get :show, params: { city: '' }
    
        # クエリパラメータとしてアラートメッセージを含むURLにリダイレクトされることを期待
        expect(response).to redirect_to(root_url(alert: '都市名を入力してください。'))
    end
  end
end
