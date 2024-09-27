class Cancellation < ApplicationRecord
  belongs_to :participation
  
  validates :reason, presence: true
  has_paper_trail
end
