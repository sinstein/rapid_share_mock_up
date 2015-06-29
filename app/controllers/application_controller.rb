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
    @current_user ||= User.find(session[params[:user_id]]) if session[params[:user_id]]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

end
