class ApplicationController < ActionController::Base
  helper_method :current_user_email, :signed_in?

  private

  def current_user_email
    session[:user_email]
  end

  def signed_in?
    current_user_email.present?
  end

  def require_login
    redirect_to login_path, alert: "Please sign in first." unless signed_in?
  end
end
