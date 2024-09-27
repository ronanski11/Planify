class PagesController < ApplicationController
  def index
    if isAdmin?
      render "admin"
    else
      render "user"
    end
  end
end
