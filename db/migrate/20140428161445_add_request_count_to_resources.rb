class AddRequestCountToResources < ActiveRecord::Migration
  def change
    add_column :locations, :request_count, :integer
    add_column :users, :request_count, :integer
    add_column :articles, :request_count, :integer
  end
end
