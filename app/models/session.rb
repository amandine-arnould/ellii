class Session < ApplicationRecord
  belongs_to :activity
  has_many :bookings
  has_many :users, through: :bookings
  has_many :messages
  validates :start_at, presence: true

  after_create :set_session_name

  scope :upcoming, -> (activity) { where(activity: activity).where("start_at >= ?", Date.today) }

  # callback ActiveRecord
  def set_session_name
    client = Twilio::REST::Client.new(ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"])
    client.video.rooms.create(unique_name: id)
  end

  def name
    months = { 4=>"Avril", 9=>"Septembre", 6=>"Juin", 3=>"Mars", 2=>"Février", 1=>"Janvier", 11=>"Novembre", 8=>"Août", 10=>"Octobre", 7=>"Juillet", 12=>"Décembre", 5=>"Mai"}
    start_at.strftime("%d").to_s + " " + months[start_at.month] + ", " + start_at.strftime("%Y").to_s + " à " + start_at.strftime("%H").to_s + "h" + start_at.strftime("%M").to_s
  end

  def remaining_slots
    activity.max_participants - bookings.length
  end
end
