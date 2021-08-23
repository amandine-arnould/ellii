class Mood < ApplicationRecord
  belongs_to :user
  validates :state, presence: true
end
