class ShopsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_path, flash: {error: I18n.t(:shop_not_exist_error, scope: :message)}
  end

  def show
  	@shop = Shop.shop_set.find(params[:id])
  end
end
