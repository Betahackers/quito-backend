class CreateArticleLocations < ActiveRecord::Migration
  def change
    create_table :article_locations do |t|
      t.integer :article_id
      t.integer :location_id
      t.integer :position

      t.timestamps
    end
  end
end
