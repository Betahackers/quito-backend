class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :foursquare_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end

    add_index :locations, :foursquare_id, unique: true
  end
end
