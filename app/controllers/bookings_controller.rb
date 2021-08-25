class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new
    @session = Session.find(params[:session_id])
    @booking.user = current_user
    @booking.session = @session

    authorize @booking

    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    authorize @booking
    redirect_back(fallback_location: dashboard_path)
  end

  private

  def generate_token(booking)
    # Create an Access Token
    token = Twilio::JWT::AccessToken.new ENV["ACCOUNT_SID"], ENV["KEY_ID"], ENV["AUTH_TOKEN"], [],
                                         ttl: 14400,
                                         identity: current_user.email
    # Grant access to Video
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    grant.room = booking.url_room
    token.add_grant grant
    # Serialize the token as a JWT
    token.to_jwt
  end
end
