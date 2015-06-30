class Attachment < ActiveRecord::Base
  belongs_to :user
  validate :file_format

  def file_format
    whitelist = ["pdf","png","jpg","jpeg","rb","txt","azw",""]
    ext = self.name.split('.')[-1]
    if !whitelist.include? ext
      errors.add(:file , " format not supported!")
    end
  end

  def validate_file_size(file_io)
    one_mb = 1048576
    if (file_io.size.to_f / one_mb > 2)
      errors.add(:file, " is larger than maximum permitted size (2 MB)")
      return false
    end
    true
  end

  private
  def
end
