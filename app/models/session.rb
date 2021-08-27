class Session < ApplicationRecord
  belongs_to :activity
  has_many :bookings
  has_many :users, through: :bookings
  validates :start_at, presence: true

  # after_create :set_session_name

  # # callback ActiveRecord
  # def set_session_name
  #   client = Twilio::REST::Client.new(ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"])
  #   client.video.rooms.create(unique_name: id)
  # end

  # def name
  #   start_at.to_s
  # end
end
