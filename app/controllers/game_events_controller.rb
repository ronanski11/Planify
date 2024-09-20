# app/controllers/game_events_controller.rb
class GameEventsController < ApplicationController
  
  def index
    @game_events = GameEvent.all
  end
  
  def new
    @game_event = GameEvent.new
    @coaches = User.where(role: 'admin')  # Adjust based on your user roles setup
    @users = User.where(role: 'user')     # Fetch all users with 'user' role
  end

  def create
    @game_event = GameEvent.new(game_event_params)
    if @game_event.save
      if params[:game_event][:user_ids].present?
        params[:game_event][:user_ids].reject(&:blank?).each do |user_id|
          @game_event.participations.create(user_id: user_id)
        end
      end
      flash[:notice] = "Game event created successfully"
      redirect_to game_events_path
    else
      @coaches = User.where(role: 'coach')
      @users = User.where(role: 'user')
      flash[:alert] = "Game event not created"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def game_event_params
    params.require(:game_event).permit(:event_name, :event_date, :location, :coach_id, user_ids: [])
  end
  
end
