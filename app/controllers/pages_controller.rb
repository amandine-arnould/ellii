require "json"
require "open-uri"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @mood = Mood.new
    @activities = Activity.all
  end

  def dashboard
    @month = { 4 => "Avril", 9 => "Septembre", 6 => "Juin", 3 => "Mars", 2 => "Février", 1 => "Janvier", 11 => "Novembre", 8 => "Août", 10 => "Octobre", 7 => "Juillet", 12 => "Décembre", 5 => "Mai" }

    @user_info = current_user
    @user_bookings = Booking.where(user: current_user)
    @user_activities = Activity.where(user: current_user)
    @booking = Booking.where

    # BALADES
    url = "https://opendata.paris.fr/api/records/1.0/search/?dataset=paris-autrement-balades-dans-les-arrondissements-peripheriques-parcours"
    balades_serialized = URI.open(url).read
    @balades = JSON.parse(balades_serialized)

    #EPHAD
    url = "https://opendata.paris.fr/api/records/1.0/search/?dataset=liste-des-ehpad"
    ephad_serialized = URI.open(url).read
    @ephad = JSON.parse(ephad_serialized)
    @image_url = "https://opendata.paris.fr/api/v2/catalog/datasets/liste-des-ehpad/files/"

    #CALENDAR
    @user_sessions = current_user.sessions_as_senior

  end
end
