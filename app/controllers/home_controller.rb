class HomeController < ApplicationController
  before_filter :login_required, only: [:dashboard]
  before_filter :current_event, only: :index

  def dashboard
    @favorite_projects = current_user.favorites
    @registered_events = current_user.events.public_events
    @upcoming_events = Event.upcoming_events.public_events
  end

  def coder_day
    @sponsors = Event.find_by_short_code('CDOS201401').sponsors if Event.find_by_short_code('CDOS201401').present?
  end

  def index
    @featured_event = Event.featured
  end

  def code_of_conduct
    @upcoming_events = Event.upcoming_events.public_events
  end
end
