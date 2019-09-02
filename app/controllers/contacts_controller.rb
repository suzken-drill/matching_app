class ContactsController < ApplicationController
  before_action :set_request_filter

  def index
  	@contact = Contact.new
  end

  def confirm
  	@contact = Contact.new(contact_params)
  	unless @contact.valid?
  	  flash.now[:error] = I18n.t(:form_error, scope: :message)
  	  render action: :index and return
  	end
  end

  def create
  	@contact = Contact.new(contact_params)
  	render action: :index and return if params[:back]
  	if @contact.save
  	  ContactMailer.send_email(@contact).deliver_later
  	  redirect_to root_path, notice: I18n.t(:send_email_thanks, scope: :message)
  	else
  	  flash.now[:error] = I18n.t(:system_error, scope: :message)
  	  render action: :index
  	end
  end

  private
  	def contact_params
  	  params.require(:contact).permit(:name, :email, :message)
  	end
  	def set_request_filter
  	  Thread.current[:request] = request
  	end
end
