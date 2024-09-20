class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
  
    has_many :participations
    has_many :game_events, through: :participations
  end