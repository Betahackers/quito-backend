class AddTagCacheToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :cached_category_list, :string
    add_column :articles, :cached_mood_list, :string
  end
end
