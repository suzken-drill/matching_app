class StaticPageController < ApplicationController
  def index
    @categories = Category.originals
    @admin_posts = AdminPost.posts.limit(AdminPost::INDEX_POST_NUM)
    @admin_reviews = AdminPost.reviews.limit(AdminPost::INDEX_REVIEW_NUM)
  end

  def help
  end

  def rule
  end

  def about
  end

  def owner
  end
end
