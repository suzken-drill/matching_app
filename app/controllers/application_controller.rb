class ApplicationController < ActionController::Base

  def not_authenticate_user?
    redirect_to root_path, flash: {error: I18n.t(:not_authenticate_user_error, scope: :message)} if user_signed_in?
  end
  def not_authenticate_owner?
    redirect_to root_path, flash: {error: I18n.t(:not_authenticate_owner_error, scope: :message)} if owner_signed_in?
  end

  # ログイン・ログアウト後のパスを設定
  # def after_sign_in_path_for(resource)
  #	  static_page_help_path
  #   if owner_signed_in?
  #     owners_show_owner(current_owner)
  #   else
  #     super(resource)
  #   end
  # end

end
