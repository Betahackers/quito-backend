class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_handle, :string
    add_column :users, :website_url, :string
  end
end
