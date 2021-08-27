class Session < ApplicationRecord
  belongs_to :activity
  has_many :bookings
  has_many :users, through: :bookings
  validates :start_at, presence: true

  after_create :set_session_name

  # callback ActiveRecord
  def set_session_name
    client = Twilio::REST::Client.new(ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"])
    client.video.rooms.create(unique_name: id)
  end


  @month = { 4=>"Avril", 9=>"Septembre", 6=>"Juin", 3=>"Mars", 2=>"Février", 1=>"Janvier", 11=>"Novembre", 8=>"Août", 10=>"Octobre", 7=>"Juillet", 12=>"Décembre", 5=>"Mai"}


  def name
    start_at.strftime("%d").to_s + "-" + start_at.month.to_s + "-" + start_at.strftime("%Y").to_s + " à " + start_at.strftime("%H").to_s
  end
end
