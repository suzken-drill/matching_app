class UserRelationshipsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_path, flash: {error: I18n.t(:user_not_exist_error, scope: :message)}
  end

  def create
  	@user = User.find(params[:id])
    current_user.follow(@user)
  end

  def destroy
  	@user = User.find(params[:id])
  	current_user.unfollow(@user)
  	render action: :create
  end
end
