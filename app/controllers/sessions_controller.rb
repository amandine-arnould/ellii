class SessionsController < ApplicationController
  def show
    @session = Session.find(params[:id])
    authorize @session
    @token = generate_token(@session)
  end

  def start
    # client = Twilio::REST::Client.new(ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"])
    # client.video.rooms.create(unique_name: id)
    @session = Session.find(params[:id])
    @session.running = true
    redirect_to activity_session_path(@session) if @session.save
  end

  def end
    @session = Session.find(params[:id])
    @session.running = false
    redirect_to dashboard_path if @session.save
  end

  def destroy
    @session = Sessions.find(params[:id])
    @session.destroy
    authorize @session
    redirect_back(fallback_location: dashboard_path)
  end

  private

  def generate_token(session)
    # CREATE AN ACCESS TOKEN
    token = Twilio::JWT::AccessToken.new ENV["ACCOUNT_SID"], ENV["KEY_ID"], ENV["API_SECRET"], [],
                                         ttl: 14400,
                                         identity: current_user.email + "$" +
                                                   current_user.status + "$" +
                                                   current_user.first_name + "$" +
                                                   current_user.last_name
    # GRANT ACCESS TO VIDEO
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    grant.room = session.id
    token.add_grant grant
    # SERIALIZE THE TOKEN AS A JWT
    token.to_jwt
  end
end
