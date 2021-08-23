class Activity < ApplicationRecord
  belongs_to :user
  has_many :sessions, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 250 }
  validates :duration, presence: true
  validates :remote, presence: true
  validates :min_participants, presence: true
  validates :max_participants, presence: true
  validates :mind, presence: true
  # address : url ou addresse physique
end
