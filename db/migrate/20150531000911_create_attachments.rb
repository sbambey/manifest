class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
    	t.integer :mission_id
    	t.attachment :file
    	t.text :description
    	t.text :source_name
    	t.text :source_link

      t.timestamps null: false
    end
  end
end
