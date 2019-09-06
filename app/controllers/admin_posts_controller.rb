class AdminPostsController < ApplicationController
  def index
  	@admin_posts = AdminPost.posts.paginate(page: params[:page], per_page: 20)
  end

  def show
    @admin_post = AdminPost.where(id: params[:id]).first
  end
end
