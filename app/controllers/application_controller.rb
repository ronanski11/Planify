class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :isAdmin?
  
  allow_browser versions: :modern

  def current_user
    # If session[:user_id] is nil, set it to nil, otherwise find the user by id.
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  before_action :require_login

  private

  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end

  def isAdmin?
    current_user.role == "admin"
  end
end
