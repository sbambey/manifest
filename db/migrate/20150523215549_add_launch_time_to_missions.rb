class AddLaunchTimeToMissions < ActiveRecord::Migration
  def self.up
    add_column :missions, :launch_date, :date
    add_column :missions, :net, :boolean
  end
end
