class CategoryPolicy < ApplicationPolicy
  def show?
    user.present?
  end
end
