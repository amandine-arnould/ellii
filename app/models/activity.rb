class Activity < ApplicationRecord
  include Abyme::Model

  LOCATION = { "Distanciel" => true, "Présentiel" => false }
  TYPE = ["Corps", "Esprit"]
  ACTIVITIES_BODY = ["Yoga", "Danse", "Badminton", "Renforcement musculaire", "Marche"]
  ACTIVITIES_MIND = ["Méditation", "Cours de cuisine", "Calligraphie", "Partie d'échecs", "Maquillage", "Musique", "Peinture", "Photographie"]
  ACTIVITY_TITLES = ACTIVITIES_BODY.concat(ACTIVITIES_MIND)
  MIN_CHAR_DESCRIPTION = 2

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :sessions, dependent: :destroy
  has_many :bookings, through: :sessions

  begin
    abymize :sessions, permit: :all_attributes
  rescue Exception => e
    puts "Abyme tried to connect and verify associations to a database that wasn't built"
  end

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: MIN_CHAR_DESCRIPTION }
  validates :duration, presence: true
  # validates :remote, presence: true
  validates :min_participants, presence: true, numericality: { greater_than: 0 }
  validates :max_participants, presence: true, numericality: { greater_than: 0 }
  # validates :mind, presence: true
  # address : url ou addresse physique
end
