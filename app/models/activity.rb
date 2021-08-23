class Activity < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 250 }
  validates :duration, presence: true
  validates :remote, presence: true
  validates :duration, presence: true
  validates :min_participants, presence: true
  validates :max_participants, presence: true
  validates :mind, presence: true

  # time & date plages horaires de dispo
  # address : url ou addresse physique
end
