class ApplicationController < ActionController::Base

  def not_authenticate_user?
    redirect_to root_path, flash: {error: I18n.t(:not_authenticate_user_error, scope: :message)} if user_signed_in?
  end
  def not_authenticate_owner?
    redirect_to root_path, flash: {error: I18n.t(:not_authenticate_owner_error, scope: :message)} if owner_signed_in?
  end
end
