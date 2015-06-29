class SessionsController < ApplicationController
  def new
    # render :json => session
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[@user.id] = @user.id
      # render :text => 'session created'
      redirect_to user_attachments_path(@user.id)
    else
      redirect_to signup_path, alert: "Invalid credentials!"
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You have been successfully logged out."
    redirect_to '/login'
  end
end
