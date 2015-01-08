class EventsController < ApplicationController
  def create
    er = CheckIn.new
    er.user = current_user
    er.event = Event.where(short_code: params[:short_code]).first

    respond_to do |format|
      format.json { render json: er.save.to_json }
    end
  end

  def index
    @events = Event.order('start_date desc')
  end

  def show
    @event = Event.find(params[:id])
  end
end
