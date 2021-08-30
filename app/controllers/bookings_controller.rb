class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new
    @session = Session.find(booking_params[:session_id].to_i)
    @booking.user = current_user
    @booking.session = @session

    authorize @booking

    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end


  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    authorize @booking
    redirect_back(fallback_location: dashboard_path)
  end

  def add_comment
    @booking = Booking.find_by(user: User.find(params["booking_comment"]['comment'].to_i), session: Session.find(params['booking_comment']['session_id'].to_i))
    @booking.update(comment: params['booking_comment']['content'])
    redirect_to dashboard_path
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:session_id)
  end
end
