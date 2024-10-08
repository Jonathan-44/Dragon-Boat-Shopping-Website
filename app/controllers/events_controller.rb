class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
    @events = @events.order(:date) if params[:sort] == 'date'
    @events = @events.where('name ILIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_path, notice: 'Event was successfully deleted.'
    else
      redirect_to events_path, alert: 'Unable to delete the event.'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end


  def event_params
    params.require(:event).permit(:name, :date, :location, :description, :url)
  end
end
