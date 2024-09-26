class PagesController < ApplicationController
  def index
    if current_user.role == "admin"
      render "admin"
    else
      render "user"
    end
  end
end
