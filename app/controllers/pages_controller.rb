class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @mood = Mood.new
    @activities = Activity.all
  end

  def dashboard
    @month = { 4=>"Avril", 9=>"Septembre", 6=>"Juin", 3=>"Mars", 2=>"Février", 1=>"Janvier", 11=>"Novembre", 8=>"Août", 10=>"Octobre", 7=>"Juillet", 12=>"Décembre", 5=>"Mai"}

    @user_info = current_user
    @user_bookings = Booking.where(user: current_user)
  end

end
