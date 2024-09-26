class GameEvent < ApplicationRecord
    belongs_to :coach, class_name: 'User', foreign_key: 'coach_id', optional: true
    has_many :participations, dependent: :destroy
    has_many :users, through: :participations
  end
  