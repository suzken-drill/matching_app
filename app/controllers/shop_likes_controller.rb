class ShopLikesController < ApplicationController
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_path, flash: {error: I18n.t(:shop_not_exist_error, scope: :message)}
  end

  # いいね
  def create
    shop = Shop.find(params[:id])
    shop_like = ShopLike.new(shop_id: shop.id, user_id: current_user.id)
    if shop_like.save
      @shop_like_num = shop.shop_likes.count
      render action: :create
    else
      redirect_to shop_path, error: t(:system_error, scope: :message)
    end
  end

  # いいね取り消し
  def destroy
    shop = Shop.find(params[:id])
    shop.shop_likes.find_by(user_id: current_user.id).destroy
    @shop_like_num = shop.shop_likes.count
    render action: :create
  end
end
