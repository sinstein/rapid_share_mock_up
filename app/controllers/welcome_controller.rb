class WelcomeController < ApplicationController
  def index
  	if current_user
  		redirect_to user_attachments_path(current_user.id), notice: "Logged in as #{User.find(session["user_id"]).email}"
  	end
  end
end
