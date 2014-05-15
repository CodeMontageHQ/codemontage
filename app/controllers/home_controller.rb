class HomeController < ApplicationController

  before_filter :login_required, :only => [:dashboard]

  def dashboard
    @favorite_projects = current_user.favorites
    @registered_events = current_user.events
    @upcoming_events = Event.upcoming_events
  end

  def coder_day 
    @sponsors = Organization.sponsors
  end

  def index
    @featured_event = Event.featured
  end

end
