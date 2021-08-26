class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @mood = Mood.new
    @activities = Activity.all
  end

  def dashboard
    @user_info = current_user
    @user_bookings = Booking.where(user: current_user)
  end
end
