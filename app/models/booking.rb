class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :session
  before_create :set_session_name

  # callback ActiveRecord
  def set_session_name
    client = Twilio::REST::Client.new(ENV["KEY_ID"], ENV["AUTH_TOKEN"])
    session = client.video.sessions.create(unique_name: "#{proposal.name}_#{Time.now.to_i}")
    self.url_session = session.unique_name
  end
end
