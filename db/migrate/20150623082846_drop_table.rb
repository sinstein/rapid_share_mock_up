class DropTable < ActiveRecord::Migration
  def up
    drop_table :attachments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
