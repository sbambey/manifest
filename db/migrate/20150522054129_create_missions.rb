class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.text :title
      t.datetime :launch_date
      t.text :body

      t.timestamps null: false
    end
  end
end
