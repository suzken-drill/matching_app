class Owners::OwnersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_path, flash: { error: I18n.t(:owner_not_exist_error, scope: :message) }
  end

  def show
  	@owner = Owner.find(params[:id])
  end
end