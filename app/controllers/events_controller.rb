class EventsController < ApplicationController
  def index
  end

  def new
  end

  def create
    parameters = params.require(:event).permit(:title, :description, :street, :start_time, :end_time, :website,
      :ticket_details, :facebook, :city_id, :category_id)
    event = current_user.events.create(parameters)
    redirect_to event_path(event)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    if current_user
      @event = Event.find(params[:id])
      if current_user.id == @event.user_id
        render :edit
      else
        redirect_to :back
      end
    else
      redirect_to :back
    end
  end

  def update
  end

  def destroy
  end
end
