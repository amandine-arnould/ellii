class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = policy_scope(Activity).order(created_at: :desc)
  end

  def show
    @booking = Booking.new
    authorize @activity
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
    @activity.remote == 'Distanciel' ? @activity.remote = 'true' :  @activity.remote = 'false'
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
    params.require(:activity).permit(:title, :description, :duration, :remote, :user, :max_participants, :min_participants, :mind, :address, sessions_attributes: [:start_at, :activity, :_destroy])
    # params.require(:activity).permit(:title, :description, :duration, :remote, :user, :max_participants, :min_participants, :mind, :address, abyme_attributes)
  end
end