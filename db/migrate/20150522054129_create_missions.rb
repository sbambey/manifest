class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
    	t.integer :number
      t.text :name
      t.datetime :launch_time
      t.text :teaser
      t.text :body
      t.text :coverage
      t.boolean :published
      t.boolean :launched
      t.integer :user_id
      t.integer :provider_id

      t.timestamps null: false
    end
  end
end
