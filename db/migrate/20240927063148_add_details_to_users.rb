class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :height, :float
    add_column :users, :weight, :float
    add_column :users, :age, :integer
    add_column :users, :nationality, :string
  end
end
