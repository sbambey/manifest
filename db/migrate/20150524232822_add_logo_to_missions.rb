class AddLogoToMissions < ActiveRecord::Migration
  def change
    add_attachment :missions, :logo
  end

  def self.down
    remove_attachment :missions, :logo
  end
end
