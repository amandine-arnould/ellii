class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :bookings
  has_many :activities
  has_many :moods
  has_many :sessions_as_senior, through: :bookings, source: :session
  has_many :sessions_as_teacher, through: :activities, source: :session

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true
  # validates :phone_number, presence: true # regex "(0|\\+33|0033)[1-9][0-9]{8}"
  # validates :address, presence: true
  # validates :avatar, presence: true

  def next_session
    current_session || bookings.joins(:session).find_by('start_at > ?', Time.zone.now)&.session
  end

  def current_session
    bookings.joins(:session).where('start_at < ?', Time.zone.now).find do |e|
      e.session.start_at + e.session.activity.duration.minutes > Time.zone.now
    end&.session
  end

  def previous_session
    bookings.joins(:session).find_by('start_at < ?', Time.zone.now)&.session
  end

  def default_avatar
    return "default_avatar.png" unless avatar.attached?

    "http://res.cloudinary.com/ellii/image/upload/#{avatar.key}"
  end
end
