class SessionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end

  def show?
    user.status == "admin" || user.status == "teacher" || user.status == "senior"
  end
end
