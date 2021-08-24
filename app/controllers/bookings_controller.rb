class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new
    @session = Session.find(params[:activity_id])
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

end
