class AddArticleIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :article_id, :integer
  end
end
