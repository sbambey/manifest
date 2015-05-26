class AddLaunchLocationToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :launch_location, :text
  end
end
