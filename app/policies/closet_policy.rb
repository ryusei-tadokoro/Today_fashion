# frozen_string_literal: true

class ClosetPolicy < ApplicationPolicy
  def show?
    user.present? && user.id == record.user_id
  end

  def create?
    user.present?
  end

  def create_step?
    create?
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

  def new_step1?
    user.present?
  end

  def new_step2?
    user.present?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
