class RemoveCoverageFromMissions < ActiveRecord::Migration
  def change
  	remove_column :missions, :coverage
  end
end
