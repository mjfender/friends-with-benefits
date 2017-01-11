class EventsController < ApplicationController
  before_action :set_user

  def new
    @need = Need.find(params[:need_id])
    @event = Event.new(:need_id => @need.id)
  end

  def create
    @event = Event.new(event_params)
    @event.need_id = params[:need_id]
    @need = Need.find(params[:need_id])
    if @event.save
      flash[:notice] = "Woo! You just made an event."
      @event.populate
      redirect_to need_event_path(@need, id: @event.id)
    else
      flash[:notice] = @event.errors.full_messages.join(" ")
      redirect_to new_need_event_path
    end
  end

  def show
    @event = Event.find(params[:id])
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
