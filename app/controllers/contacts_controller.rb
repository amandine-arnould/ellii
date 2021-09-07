class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @contact = Contact.new
    skip_authorization
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    skip_authorization
    if @contact.deliver
      flash.now[:success] = "Message sent!"
    else
      flash.now[:error] = "Could not send message"
      render :new
    end
  end
end
