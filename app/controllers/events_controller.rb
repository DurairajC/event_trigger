class EventsController < ApplicationController
  include IterableEvent
  before_action :authenticate_user!

  def index
  end

  def create
    begin
      event = IterableEvent.create_event(current_user.email,params[:name])
      if event.success?
        redirect_to events_path, notice: "Event created successfully"
      else
        redirect_to events_path, alert: "Unable to create event. #{event&.msg}"
      end
    rescue => e
      redirect_to events_path, alert: "Unable to create event. #{e.message}"
    end
  end

end
