class WeatherDataPolicy
  attr_reader :user, :weather_data

  def initialize(user, weather_data)
    @user = user
    @weather_data = weather_data
  end

  def map?
    # ここに認可ロジックを実装します。例:
    user.admin? || weather_data['name'] == '新宮市'
  end
end