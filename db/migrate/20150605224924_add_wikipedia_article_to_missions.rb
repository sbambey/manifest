class AddWikipediaArticleToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :wikipedia_article, :text
  end
end
