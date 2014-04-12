class RemoveArticleIdFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :article_id
  end
end
