class AddSizeToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :size, :real
  end
end
