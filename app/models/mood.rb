class Mood < ApplicationRecord
  belongs_to :user
  validates :score, presence: true

  SCORES = [1, 2, 3, 4, 5]
end
