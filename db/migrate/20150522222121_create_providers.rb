class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.text :name
      t.text :website

      t.timestamps null: false
    end
  end
end
