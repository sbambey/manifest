class AddLogoToProviders < ActiveRecord::Migration
  def self.up
    add_attachment :providers, :logo
    add_attachment :providers, :banner
  end

  def self.down
    remove_attachment :providers, :logo
    remove_attachment :providers, :banner
  end
end
