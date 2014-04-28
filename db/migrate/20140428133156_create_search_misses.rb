class CreateSearchMisses < ActiveRecord::Migration
  def change
    create_table :search_misses do |t|
      t.string :query

      t.timestamps
    end
  end
end
