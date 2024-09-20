class UpdateUsersTable < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :role, :string
    add_column :users, :email, :string
    remove_column :users, :name
  end
end
