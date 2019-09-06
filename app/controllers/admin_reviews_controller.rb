class AdminReviewsController < ApplicationController
  def index
  	@admin_reviews = AdminPost.reviews.paginate(page: params[:page], per_page: 20)
  end

  def show
    @admin_review = AdminPost.where(id: params[:id]).first
  end
end
