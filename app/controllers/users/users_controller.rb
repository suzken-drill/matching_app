class Users::UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_path, error: I18n.t(:user_not_exist_error, scope: :message)
  end

  def show
    @user = User.find(params[:id])
    @shop_reviews = ShopReview.where(user_id: @user.id).includes(:shop, :shop_review_evals, :shop_review_photos).paginate(page: params[:page], per_page: User::REVIEW_PER_PAGE)
  end

end