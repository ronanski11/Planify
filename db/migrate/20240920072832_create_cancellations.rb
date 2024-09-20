class CreateCancellations < ActiveRecord::Migration[7.2]
  def change
    create_table :cancellations do |t|
      t.integer :participation_id
      t.text :reason
      t.datetime :cancelled_at

      t.timestamps
    end

    add_foreign_key :cancellations, :participations, column: :participation_id
    add_index :cancellations, :participation_id
  end
end
