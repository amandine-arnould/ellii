class ActivitiesController < ApplicationController
  def index
    # @activities = policy_scope(Activity).order(created_at: :desc)
    @activities = Activity.all
  end
end
