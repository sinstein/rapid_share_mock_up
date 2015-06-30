class SessionsController < ApplicationController
  before_action :check_login, except: :destroy

  def new
    # render :json => session
  end

  def create
    @user = User.find_by_email(params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      session["user_id"] = @user.id
      # render :text => 'session created'
      redirect_to user_attachments_path(session["user_id"])
    else
      redirect_to signup_path, alert: "Invalid credentials!"
    end
  end

  def destroy
    @user = User.find(params[:format])
    if current_user.id == @user.id
      reset_session
      flash[:notice] = "You have been successfully logged out."
    end
    redirect_to '/login'
  end

end
