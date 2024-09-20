class CreateParticipations < ActiveRecord::Migration[7.2]
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :game_event_id
      t.string :status

      t.timestamps
    end
    
    add_foreign_key :participations, :users, column: :user_id
    add_foreign_key :participations, :game_events, column: :game_event_id
    add_index :participations, :user_id
    add_index :participations, :game_event_id
  end
end
