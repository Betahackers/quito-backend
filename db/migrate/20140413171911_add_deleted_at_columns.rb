class AddDeletedAtColumns < ActiveRecord::Migration
  def change
    add_column :users, :deleted_at, :datetime
    add_column :articles, :deleted_at, :datetime

    add_index :users, :deleted_at
    add_index :articles, :deleted_at
  end
end
