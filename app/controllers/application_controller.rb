class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_prefecture_data

  def configure_permitted_parameters
    # 新規登録時(sign_up時)にnameとresidenceというキーのパラメーターを追加で許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :residence])
  end

  def set_prefecture_data
    @prefecture_data ||= load_prefecture_data
  end

  private

  def load_prefecture_data
    # CSVファイルのパスを指定してデータを読み込む
    csv_path = Rails.root.join('prefectures.csv')

    # CSVファイルが存在するか確認
    return [] unless File.exist?(csv_path)

    # CSVファイルを読み込み、ハッシュの配列に変換
    csv_data = CSV.read(csv_path, headers: true)
    csv_data.map { |row| { "prefecture" => row["prefecture"], "english" => row["english"] } }
  end
end
