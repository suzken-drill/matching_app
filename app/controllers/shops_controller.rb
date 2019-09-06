class ShopsController < ApplicationController
  def show
  	@shop = Shop.where(id: params[:id]).first
  end
end
