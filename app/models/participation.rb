class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :game_event
  has_many :cancellations, dependent: :destroy
  has_paper_trail
end
