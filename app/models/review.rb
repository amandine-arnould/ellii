class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :mood, presence: true
end
