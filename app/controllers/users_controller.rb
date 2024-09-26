class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  skip_before_action :require_login, only: [:new, :create]


  def create
    @user = User.new(user_params)
    @user.role = "user"

    if @user.email == "ronanski@ronanski11.com"
      @user.role = "admin"
    end
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to users_path
    else
      flash[:alert] = "User not created"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # Assuming you have a method current_user that fetches the logged-in user's info
    @user = current_user
  end

  def edit
    @user = current_user # or however you access the current user
  end

  def update
    @user = current_user # or however you access the current user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Profile updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role) # Add or remove parameters as needed
  end
end