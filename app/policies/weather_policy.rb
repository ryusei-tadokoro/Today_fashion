class WeatherPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def map?
    true
  end
end
