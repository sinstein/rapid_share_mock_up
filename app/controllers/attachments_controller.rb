class AttachmentsController < ApplicationController

  before_action :authorize, except: :download

  def new
    @attachment = Attachment.new
  end

  def index
    @attachments = Attachment.where(:user_id => session["user_id"])
    if(@attachments.empty?)
      render "new"
    end
  end

  def create
    @user = User.find(params[:user_id])
    @attachment = Attachment.new(params[:attachment => {:file => [ :original_filename ]}])

    if params[:attachment].nil?
      flash.now[:alert] = "No file found!"
      render "new"
    else
      uploaded_io = params[:attachment][:file]
      @attachment.user_id = @user.id
      @attachment.name = params[:attachment][:file].original_filename
      @attachment.format = params[:attachment][:file].content_type
      @attachment.alias = Time.now.to_i.to_s + @attachment.name

      if @attachment.validate_file_size(uploaded_io) && @attachment.save
        File.open(Rails.root.join('public/data', @attachment.alias), 'wb') do |file|
          file.write(uploaded_io.read)
        end
        redirect_to user_attachments_path, notice: "The file #{@attachment.name} has been uploaded."
      else
        render "new"
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @attachment = user.attachments.find(@user.id)
  end

  def download
    @user = User.find(params[:user_id])
    if(!Attachment.exists?(:id => params[:id]))
      flash[:alert] = "File not found!"
      redirect_to user_attachments_path
    else
      @attachment = @user.attachments.find(params[:id])
      path = Rails.root.join('public/data', @attachment.alias)
      send_file path
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    if(!Attachment.exists?(:id => params[:id]))
      flash[:alert] = "File not found!"
      redirect_to user_attachments_path
    else
      @attachment = @user.attachments.find(params[:id])
      name = @attachment.name
      File.delete(Rails.root.join('public/data', @attachment.alias))
      @attachment.destroy
      redirect_to user_attachments_path, alert: "The file #{name} has been deleted!"
    end
  end
end
