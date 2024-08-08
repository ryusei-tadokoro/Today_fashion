class WeatherPolicy < ApplicationPolicy
  def map?
    # ここに認可ロジックを記述します。例えば:
    user.admin? || user.member?
  end
end
