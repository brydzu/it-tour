class EventsController < ApplicationController
  def index
    @event = EventDecorator.decorate current_conference.current_event
    render :show
  rescue ActiveRecord::RecordNotFound => e
    render :show_not_found
  end

  def show
    @event = EventDecorator.decorate current_conference.announced_event_named(params[:year])

    if @event.current?
      redirect_to root_path
    end
  end
end
