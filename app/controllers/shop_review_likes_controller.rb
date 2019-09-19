class ShopReviewLikesController < ApplicationController
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_path, flash: {error: I18n.t(:shop_not_exist_error, scope: :message)}
  end

  # いいね
  def create
  	shop_review = ShopReview.find(params[:id])
  	shop_review_like = ShopReviewLike.new(shop_review_id: shop_review.id, user_id: current_user.id)
    if shop_review_like.save
      @shop_review_like_num = shop_review.shop_review_likes.count
      render action: :create
    else
      redirect_to shop_shop_review_path(shop_id: shop_review.shop_id, id: shop_review.id), flash: {error: t(:system_error, scope: :message)}
    end
  end

  # いいね取り消し
  def destroy
  	shop_review = ShopReview.find(params[:id])
    shop_review.shop_review_likes.find_by(user_id: current_user.id).destroy
    @shop_review_like_num = shop_review.shop_review_likes.count
    render action: :create
  end
end
