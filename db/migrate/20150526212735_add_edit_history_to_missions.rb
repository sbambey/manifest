class AddEditHistoryToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :edit_history, :text, default: []
  end
end
