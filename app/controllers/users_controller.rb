class UsersController < ApplicationController
  before_action :check_login, only: [:new ,:create]

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if (@user.save)
      session["user_id"] = @user.id
      redirect_to user_attachments_path(@user.id)
    else
      render "new"
    end
  end

  def show
  	@user = User.find(current_user.id)
  end

  def update
  end

  def destroy
  end

  private
  def user_params
  	params.require(:user).permit(:email.downcase, :password, :password_confirmation)
  end
end
