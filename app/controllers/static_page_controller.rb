class StaticPageController < ApplicationController
  def index
    @categories = Category.originals
    @admin_posts = AdminPost.posts.limit(AdminPost::INDEX_POST_NUM)
    @admin_reviews = AdminPost.reviews.limit(AdminPost::INDEX_REVIEW_NUM)
    @shop_reviews = ShopReview.all.includes(:shop, :shop_review_evals, :shop_review_likes, :shop_review_photos).limit(ShopReview::INDEX_REVIEW_NUM)
  end

  def help
  end

  def rule
  end

  def about
  end

  def manage
  end
end
