class Session < ApplicationRecord
  belongs_to :activity
  has_many :bookings
  has_many :users, through: :bookings
  validates :start_at, presence: true
end
