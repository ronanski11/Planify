class Cancellation < ApplicationRecord
  belongs_to :participation
  
  validates :reason, presence: true
end
