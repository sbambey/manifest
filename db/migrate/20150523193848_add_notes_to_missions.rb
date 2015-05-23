class AddNotesToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :notes, :text
  end
end
