class AttachmentsController < ApplicationController
  def new
  end
  
  def index
    @attachments = Attachment.all
  end

  def create
    @attachment = Attachment.new(params[:attachment => {:file => [ :original_filename ]}])
    uploaded_io = params[:attachment][:file]
    @attachment.name = params[:attachment][:file].original_filename
    @attachment.format = params[:attachment][:file].content_type
    @attachment.save
    File.open(Rails.root.join('public/data', @attachment.name), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    redirect_to @attachment
  end
  
  def show
    @attachment = Attachment.find(params[:id])
  end

  def download
    @attachment = Attachment.find(params[:id])
    path = Rails.root.join('public/data', @attachment.name)
    send_file path
  end
    
  def destroy
    @attachment = Attachment.find(params[:id])
    File.delete(Rails.root.join('public/data', @attachment.name))
    @attachment.destroy 
    redirect_to attachments_path
  end

  private
  def attachment_params
    params.require(:attachment).permit! 
  end
end
