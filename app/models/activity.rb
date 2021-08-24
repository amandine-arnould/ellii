class Activity < ApplicationRecord
  include Abyme::Model

  LOCATION = { "Distanciel" => true, "Présentiel" => false }
  TYPE = ["Corps", "Esprit"]
  TITLE = ["Yoga", "Danse", "Ecriture", "Cours de cuisine", "Méditation"]
  ACTIVITIES_TYPE = [["Yoga", "corps"], ["Danse", "Esprit"]]
  MIN_CHAR_DESCRIPTION = 250

  belongs_to :user
  has_many :sessions, dependent: :destroy
  abymize :sessions

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: MIN_CHAR_DESCRIPTION }
  validates :duration, presence: true
  validates :remote, presence: true
  validates :min_participants, presence: true, numericality: { greater_than: 1 }
  validates :max_participants, presence: true
  validates :mind, presence: true
  # address : url ou addresse physique
end
