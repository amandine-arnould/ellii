class MessagesController < ApplicationController
  def create
    @session = Session.find(params[:activity_session_id])
    @message = Message.new(message_params)
    @message.session = @session
    @message.user = current_user

    skip_authorization
    if @message.save
      SessionChannel.broadcast_to(
        @session,
        render_to_string(partial: "message", locals: { message: @message })
      )
      respond_to do |format|
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
