class MoodsController < ApplicationController
  def index
    @moods = Mood.all
  end

  def create
    @mood = Mood.new(mood_params)
    @mood.user = current_user
    authorize @mood
    if @mood.save
      respond_to do |format|
        format.json {
          html_content = render_to_string partial: "pages/mood_notification", locals: {score: @mood.sentence}, layout: false, formats: [:html]
          render json: {
                   partial: html_content,
                 }
        }
      end
    end
  end

  private

  def mood_params
    params.require(:mood).permit(:score, :user)
  end
end
