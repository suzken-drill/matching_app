class ShopContactsController < ApplicationController
  before_action :set_request_filter

  def index
  	@shop_contact = ShopContact.new
  end

  def confirm
  	@shop_contact = ShopContact.new(shop_contact_params)
  	unless @shop_contact.valid?
  	  flash.now[:error] = I18n.t(:form_error, scope: :message)
  	  render action: :index and return
  	end
  end

  def create
  	@shop_contact = ShopContact.new(shop_contact_params)
  	render action: :index and return if params[:back]
  	if @shop_contact.save
  	  ContactMailer.send_shop_email(@shop_contact).deliver_later
  	  redirect_to root_path, notice: I18n.t(:send_email_thanks, scope: :message)
  	else
  	  flash.now[:error] = I18n.t(:system_error, scope: :message)
  	  render action: :index
    end    
  end

  private
  	def shop_contact_params
  	  params.require(:shop_contact).permit(:shop_name, :person_name, :email, :message)
  	end
  	def set_request_filter
  	  Thread.current[:request] = request
  	end
end
