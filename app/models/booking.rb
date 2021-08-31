class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :session

  SCORES = [1, 2, 3, 4, 5]
end
