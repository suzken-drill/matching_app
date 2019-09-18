class ShopReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_path, flash: {error: I18n.t(:shop_not_exist_error, scope: :message)}
  end

  def index
  	@shop_reviews = ShopReview.all.includes(:shop, :shop_review_evals, :shop_review_likes, :shop_review_photos).paginate(page: params[:page], per_page: ShopReview::PER_PAGE)
  end

  def show
  	@shop_review = ShopReview.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
  	redirect_to root_path, error: I18n.t(:shop_review_not_exist_error, scope: :message)
  end

  def new
  	@shop = Shop.find(params[:id])
  	@shop_review = ShopReview.new
  	5.times { |i| @shop_review.shop_review_evals.build(eval_key: ShopReviewEval::EVAL_KEYS[i]) }
  end

  def create
  	@shop_review = ShopReview.new(shop_review_params)
  	@shop_review.user_id = current_user.id
  	@shop = Shop.find(@shop_review.shop_id)
#  	Rails.logger.debug @shop_review.inspect
#    ActiveRecord::Base.transaction do
      if @shop_review.save
      	redirect_to @shop, notice: I18n.t(:shop_review_insert, scope: [:message, :shop_review])
      else
      	render action: :new and return
      end
#    end
#      if ShopReview.review_create!(@shop_review_form, current_user)
#  	    redirect_to @shop, notice: I18n.t(:shop_review_insert, scope: [:message, :shop_review])
#      else
#        flash.now[:error] = I18n.t(:system_error, scope: :message)
#  	    render action: :new and return
#      end
#  	end
#  	else
#      flash.now[:error] = I18n.t(:form_error, scope: :message)
#      render action: :new and return
#  	end
  end

  private
    def shop_review_params
      params.require(:shop_review).permit(
        ShopReview::REGISTRABLE_ATTRIBUTES +
      	[shop_review_evals_attributes: ShopReviewEval::REGISTRABLE_ATTRIBUTES] +
      	[shop_review_photos_attributes: ShopReviewPhoto::REGISTRABLE_ATTRIBUTES]
      )
    end
end
