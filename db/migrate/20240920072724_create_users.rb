class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :password_confirmation
      t.string :password_digest
      t.string :role
      t.string :email

      t.timestamps
    end
  end
end
