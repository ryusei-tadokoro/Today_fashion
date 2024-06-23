class ClosetPolicy < ApplicationPolicy
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
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
