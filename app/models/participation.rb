# app/models/participation.rb
class Participation < ApplicationRecord
    belongs_to :user
    belongs_to :game_event
  end
  