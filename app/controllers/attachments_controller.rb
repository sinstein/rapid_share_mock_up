class AttachmentsController < ApplicationController
  
  before_action :authorize, except: :download

  def new
  end
  
  def index
    @attachments = Attachment.where(:user_id => params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @attachment = Attachment.new(params[:attachment => {:file => [ :original_filename ]}])
    uploaded_io = params[:attachment][:file]
    @attachment.user_id = @user.id
    @attachment.name = params[:attachment][:file].original_filename
    @attachment.format = params[:attachment][:file].content_type
    @attachment.save
    File.open(Rails.root.join('public/data', @attachment.name), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    render "show"
  end
  
  def show
    @user = User.find(params[:user_id])
    @attachment = user.attachments.find(@user.id)
  end

  def download
    @user = User.find(params[:user_id])
    @attachment = @user.attachments.find(params[:id])
    path = Rails.root.join('public/data', @attachment.name)
    send_file path
  end
    
  def destroy
    @user = User.find(params[:user_id])
    @attachment = @user.attachments.find(params[:id])
    File.delete(Rails.root.join('public/data', @attachment.name))
    @attachment.destroy 
    redirect_to user_attachments_path
  end
end
