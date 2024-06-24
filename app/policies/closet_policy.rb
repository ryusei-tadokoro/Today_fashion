class ClosetPolicy < ApplicationPolicy
  def show?
    user.present? && user.id == record.user_id
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    user.present? && user.id == record.user_id
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user.id == record.user_id
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
