class SessionsController < ApplicationController
  def show
    @session = Session.find(params[:id])
    @message = Message.new
    authorize @session
    @token = generate_token(@session)
  end

  def destroy
    @session = Sessions.find(params[:id])
    @session.destroy
    authorize @session
    redirect_back(fallback_location: dashboard_path)
  end

  def slots
    skip_authorization
    @session = Session.find(params[:id])

    respond_to do |format|
      format.json { render json: { slots: @session.remaining_slots } }
    end
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
    grant.room = session.hex_key
    token.add_grant grant
    # SERIALIZE THE TOKEN AS A JWT
    token.to_jwt
  end
end
