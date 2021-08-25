class MoodsController < ApplicationController
  def index
    @moods = Mood.all
  end

  def create
    @mood = Mood.new(mood_params)
    @mood.user = current_user
    authorize @mood
    if @mood.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def mood_params
    params.require(:mood).permit(:score, :user)
  end
end
