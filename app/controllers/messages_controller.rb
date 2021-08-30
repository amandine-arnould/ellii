class MessagesController < ApplicationController
  def create
    @session = Session.find(params[:session_id])
    @message = Message.new(message_params)
    @message.session = @session
    @message.user = current_user
    if @message.save
      redirect_to session_path(@session, anchor: "message-#{@message.id}")
      SessionChannel.broadcast_to(
        @session,
        render_to_string(partial: "message", locals: { message: @message })
      )
    else
      render "sessions/show"
    end
  end

  private

  def message_params
    require(:message).permit(:content)
  end
end
