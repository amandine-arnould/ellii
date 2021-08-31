if @message.persisted?
  json.form json.partial!("messages/form.html.erb", session: @session, message: Message.new)
else
  json.form json.partial!("messages/form.html.erb", session: @session, message: @message)
end
