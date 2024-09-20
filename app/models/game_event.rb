class GameEvent < ApplicationRecord
    # Ensure you have this line in your GameEvent model
    belongs_to :coach, class_name: 'User', foreign_key: 'coach_id', optional: true
    has_many :participations
  has_many :users, through: :participations

end
  