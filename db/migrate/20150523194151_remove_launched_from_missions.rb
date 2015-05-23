class RemoveLaunchedFromMissions < ActiveRecord::Migration
  def change
  	remove_column :missions, :launched
  end
end
