class HomeController < ApplicationController

  before_filter :login_required, :only => [:dashboard]

  def dashboard
    @favorite_projects = current_user.favorites
    @registered_events = current_user.events
    @upcoming_events = Event.upcoming_events
  end

  def coder_day 
    @sponsors = Event.find_by_short_code('CDOS201401').sponsors unless !Event.find_by_short_code('CDOS201401').present?
  end

  def index
    @featured_event = Event.featured
  end

  def code_of_conduct
    @upcoming_events = Event.upcoming_events
  end
end
