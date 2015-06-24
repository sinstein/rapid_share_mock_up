class SessionsController < ApplicationController
  def new
    # render :json => session
  end

  def create
    @user = User.find_by_username(params[:username])

    if @user && @user.authenticate(params[:password])
      session[@user.id] = @user.id
      # render :text => 'session created'
      redirect_to user_attachments_path(@user.id)
    else
      redirect_to signup_path
    end
  end

  def destroy
    reset_session
    redirect_to '/login'
  end
end
