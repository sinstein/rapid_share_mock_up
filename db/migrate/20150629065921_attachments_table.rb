class AttachmentsTable < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :format
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
