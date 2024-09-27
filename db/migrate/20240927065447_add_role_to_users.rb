class AddRoleToUsers < ActiveRecord::Migration[7.2]
  def up
    # Assuming 'role' is currently a string, we first remove it
    remove_column :users, :role, :string

    # Now add the role back as an integer with a default value
    add_column :users, :role, :integer, default: 0
  end

  def down
    change_column :users, :role, :string
  end
end
