class GameEventsController < ApplicationController
  before_action :set_game_event, only: [:show, :edit, :update, :destroy]

  # GET /game_events
  def index
    @game_events = GameEvent.all
  end

  # GET /game_events/:id
  def show
    # @game_event is set by the set_game_event method
  end

  # GET /game_events/new
  def new
    @game_event = GameEvent.new
    @coaches = User.where(role: :admin)
    @users = User.where(role: :user)     # Fetch all users with 'user' role
  end

  # app/controllers/game_events_controller.rb
  def assignedGames
    if current_user.role == "user"
      @participations = current_user.participations.includes(:game_event)
    else
      flash[:alert] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end  

  # POST /game_events
  def create
    @game_event = GameEvent.new(game_event_params)
    if @game_event.save
      if params[:game_event][:user_ids].present?
        params[:game_event][:user_ids].reject { |user_id| user_id.blank? || user_id.nil? }.each do |user_id|
          unless @game_event.participations.exists?(user_id: user_id)
            @game_event.participations.create(user_id: user_id)
          end
        end
      end
      flash[:notice] = "Game event created successfully"
      redirect_to game_events_path
    else
      @coaches = User.where(role: :admin)
      @users = User.where(role: :user)
      flash[:alert] = "Game event not created"
      render :new, status: :unprocessable_entity
    end
  end  

  # GET /game_events/:id/edit
  def edit
    @coaches = User.where(role: 'admin')
    @users = User.where(role: 'user')
  end

  # PATCH/PUT /game_events/:id
  def update
    if @game_event.update(game_event_params)
      flash[:notice] = "Game event updated successfully"
      redirect_to game_event_path(@game_event)
    else
      @coaches = User.where(role: :admin)
      @users = User.where(role: :user)
      flash[:alert] = "Game event not updated"
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /game_events/:id
  def destroy
    @game_event.destroy
    flash[:notice] = "Game event deleted successfully"
    redirect_to game_events_path
  end

  private

  def set_game_event
    @game_event = GameEvent.find(params[:id])
  end

  def game_event_params
    params.require(:game_event).permit(:event_name, :event_date, :location, :coach_id, user_ids: [])
  end
end
