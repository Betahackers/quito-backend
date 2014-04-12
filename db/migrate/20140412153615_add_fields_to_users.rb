class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profession, :string
    add_column :users, :nationality, :string
    add_column :users, :expert_in, :string
  end
end
