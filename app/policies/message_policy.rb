class MessagePolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end

  def create?
    (user.status == "admin" || user.status == "senior" || user.status == "teacher") &&
      record.session.bookings.where(user: user).any?
  end
end
