class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.status == "admin" || user.status == "senior"  || user.status == "relative"
  end

  def show?
    user.status == "admin" || user.status == "senior"  || user.status == "relative"
  end

  def new?
    user.status == "admin" || user.status == "senior"  || user.status == "relative"
  end

  def create?
    user.status == "admin" || user.status == "senior"  || user.status == "relative"
  end

  def destroy?
    user.status == "admin" || user.status == "senior"  || user.status == "relative"
  end

  def add_comment?
    user.status == "admin" || record.session.activity.user == user
  end
end
