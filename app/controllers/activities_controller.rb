class ActivitiesController < ApplicationController
  def index
    @activities = PaperTrail::Version.order('created_at DESC').limit(100)
  end
end
