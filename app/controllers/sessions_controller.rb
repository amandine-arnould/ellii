class SessionsController < ApplicationController
  def show
    @session = Session.find(params[:id])
    authorize @session
    @token = generate_token(@session)
  end

  private

  def generate_token(session)
    # Create an Access Token
    token = Twilio::JWT::AccessToken.new ENV["ACCOUNT_SID"], ENV["KEY_ID"], ENV["API_SECRET"], [],
                                         ttl: 14400,
                                         identity: current_user.email + "$" +
                                                   current_user.status + "$" +
                                                   current_user.first_name + "$" +
                                                   current_user.last_name
    # Grant access to Video
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    grant.room = session.id
    token.add_grant grant
    # Serialize the token as a JWT
    token.to_jwt
  end

end
