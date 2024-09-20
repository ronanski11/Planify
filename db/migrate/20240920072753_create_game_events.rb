class CreateGameEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :game_events do |t|
      t.string :event_name
      t.datetime :event_date
      t.string :location
      t.integer :coach_id

      t.timestamps
    end
    
    add_foreign_key :game_events, :users, column: :coach_id
    add_index :game_events, :coach_id
  end
end
