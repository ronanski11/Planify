class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    enum role: { guest: 0, user: 1, admin: 2 }
    after_initialize :set_default_role, if: :new_record?

  
    has_many :participations
    has_many :game_events, through: :participations

    private

    def set_default_role
      self.role ||= :guest
    end
  end