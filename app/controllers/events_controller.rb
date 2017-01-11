class EventsController < ApplicationController
  before_each :set_user

  def new
    @need = Need.find(params[:need_id])
    @event = Event.new(:need_id => @need.id)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Woo! You just made an event."
      redirect_to @event
    else
      flash[:notice] = @event.errors.full_messages.join(" ")
      redirect_to new_event_path
    end
  end

  def show

  end

  def index

  end

  def edit

  end


  def update

  end

  def destroy

  end

  private

  def event_params
    params.require(:event).permit(:description, :time, :location, :need_id)
  end


end
