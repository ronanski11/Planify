class PagesController < ApplicationController
    def index
      if current_user.blank?
        redirect_to "/user_sessions/new"
      end
    end
  
    # secret is a private page, only logged-in user can enter
    def secret
      if current_user.blank?
        render plain: '401 Unauthorized', status: :unauthorized
      end
    end
  end