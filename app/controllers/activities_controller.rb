class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    if params[:mind].present?
      @activities = policy_scope(Activity).order(created_at: :desc).where(mind: params[:mind])
    else
      @activities = policy_scope(Activity).order(created_at: :desc)
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @booking = Booking.new
    authorize @activity

    if @activity.remote == false
      @marker =
        {
          lat: @activity.latitude,
          lng: @activity.longitude,
          info_window: render_to_string(partial: "info_window", locals: { activity: @activity })
      }
    else
    end
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    authorize @activity
    Activity::ACTIVITIES_MIND.include?(@activity.title) ? @activity.mind = 'true' : @activity.mind = 'false'
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
    authorize @activity
  end

  def update
    @activity.update(activity_params)
    redirect_to dashboard_path
    authorize @activity
  end

  def destroy
    @activity.destroy
    redirect_to activities_path
    authorize @activity
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :duration, :remote, :user, :max_participants, :min_participants, :mind, :address, abyme_attributes)
  end
end
