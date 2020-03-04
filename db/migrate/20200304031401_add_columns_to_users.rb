class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :location, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
  end
end
