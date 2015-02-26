class EventsController < ApplicationController
  before_filter :current_event, only: :index

  def create
    er = EventRegistration.new
    er.user = current_user
    er.event = Event.where(short_code: params[:short_code]).first

    respond_to do |format|
      format.json { render json: er.save.to_json }
    end
  end

  def index
    @upcoming_events = Event.upcoming_events.public_events.order("start_date desc")
    @past_events = Event.past_events.public_events.order("start_date desc")
  end

  def show
    @event = Event.find(params[:id])
    @featured_projects = @event.projects
  end
end
