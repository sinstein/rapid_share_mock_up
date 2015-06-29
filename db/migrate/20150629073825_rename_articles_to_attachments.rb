class RenameArticlesToAttachments < ActiveRecord::Migration
  def change
    rename_table :articles, :attachments
  end
end
