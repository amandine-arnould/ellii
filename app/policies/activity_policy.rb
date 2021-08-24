class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end

  def index?
    user.status == "senior" || user.status == "relative" || user.status == "admin"
  end

  def show?
    user.status == "senior" || user.status == "relative" || user.status == "admin"
  end

  def new?
    user.status == "teacher" || user.status == "admin"
  end

  def create?
    user.status == "teacher" || user.status == "admin"
  end

  def edit?
    user.status == "teacher" || user.status == "admin"
  end

  def update?
    user.status == "teacher" || user.status == "admin"
  end

  def destroy?
    user.status == "teacher" || user.status == "admin"
  end
end
