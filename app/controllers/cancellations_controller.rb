# app/controllers/cancellations_controller.rb
class CancellationsController < ApplicationController
    before_action :set_game_event
    before_action :set_participation
  
    def new
      @cancellation = Cancellation.new
    end
  
    def create
      @cancellation = Cancellation.new(cancellation_params)
      @cancellation.participation_id = @participation.id
      @cancellation.cancelled_at = Time.current
  
      # Remove the transaction block for debugging and save individually
      if @cancellation.save
        @participation.update(status: 'cancelled') # Don't delete participation; mark it cancelled instead
        flash[:notice] = "Your participation has been canceled."
        redirect_to assigned_games_path
      else
        flash[:alert] = "There was an error processing your cancellation."
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_game_event
      @game_event = GameEvent.find(params[:game_event_id])
    end
  
    def set_participation
      @participation = @game_event.participations.find_by(user_id: current_user.id)
      if @participation.nil?
        flash[:alert] = "You are not participating in this event."
        redirect_to assigned_games_path
      end
    end
  
    def cancellation_params
      params.require(:cancellation).permit(:reason)
    end
  end
  