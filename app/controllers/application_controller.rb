class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActionController::InvalidAuthenticityToken, :with => :invalid_access

  def invalid_access
    flash[:alert] = "Access Denied!!"
    redirect_to user_attachments_path
  end

  def current_user
    @current_user ||= User.find(session["user_id"]) if session["user_id"]
  end
  helper_method :current_user

  def authorize
    if !params.empty? && params.key?(:user_id) && current_user.id.to_s != params[:user_id]
      redirect_to login_path
    end
  end

  def check_login
    if current_user
      redirect_to user_attachments_path(current_user.id)
    end
  end

end
