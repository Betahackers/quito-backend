class AddKindOfToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :kind, :string
  end
end
