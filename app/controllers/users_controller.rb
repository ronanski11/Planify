class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :require_login, except: [:new, :create]
  skip_before_action :require_login, only: [:new, :create]
  before_action :check_admin, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = :user

    if @user.email == "ronanski@ronanski11.com"
      @user.role = :admin
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
    @user = User.find(params[:id])
  end

  def edit
    # The @user instance variable is now set based on params[:id]
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_admin
    redirect_to(root_url, alert: "Not authorized") unless isAdmin?
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :height, :weight, :nationality, :age) # Add or remove parameters as needed
  end
end
