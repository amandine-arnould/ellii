require "sendgrid-ruby"

class ContactsController < ApplicationController
  include SendGrid
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @contact = Contact.new
    skip_authorization
  end

  def create
    skip_authorization
    from = SendGrid::Email.new(email: "andrea@ellii.net")
    to = SendGrid::Email.new(email: "andrea@ellii.net")
    subject = "FORMULAIRE ELLII"
    name = params[:contact][:name]
    email = params[:contact][:email]
    message = params[:contact][:message]
    content = SendGrid::Content.new(type: "text/plain", value: "Name : #{name} - Email : #{email} - Message : #{message}")
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
    response = sg.client.mail._("send").post(request_body: mail.to_json)
  end
end
