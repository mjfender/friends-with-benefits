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
    @need = Need.find(params[:need_id])
  end

  def index

  end

  def edit
    @event = Event.find(params[:id])
    @need = Need.find(params[:need_id])
  end

  def update
    @need = Need.find(params[:need_id])
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "You've successfully updated your event!"
      redirect_to need_event_path(@need, id: @event.id)
    else
      flash[:notice] = "Edit was unsuccessful. Please re-enter your changes."
      redirect_to edit_need_event_path(@need, id: @event.id)
    end
  end

  def destroy
    @need = Need.find(params[:need_id])
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Your event was deleted."
    redirect_to need_path(@need)
  end

  private

  def event_params
    params.require(:event).permit(:description, :time, :location, :need_id)
  end


end
