class AddDefaultStatusToParticipations < ActiveRecord::Migration[7.2]
  def change
    change_column_default :participations, :status, 'attending'
  end
end
