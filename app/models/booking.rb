class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :session
  validates_uniqueness_of :user, scope: [:session_id]

  SCORES = [1, 2, 3, 4, 5]
end
