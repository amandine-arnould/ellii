class SessionChannel < ApplicationCable::Channel
def subscribed
  session = Session.find(params[:id])
  stream_for session
end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
