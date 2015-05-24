class AddSlugToProvidersAndMissions < ActiveRecord::Migration
  def change
  	add_column :providers, :slug, :string, unique: true
  	add_column :missions, :slug, :string, unique: true
  end
end
