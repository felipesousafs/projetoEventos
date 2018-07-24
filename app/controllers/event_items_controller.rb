class EventItemsController < ApplicationController
  before_action :set_event_items
  before_action :set_event_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET events/1/event_items
  def index
    @event_items = @event.event_items
  end

  # GET events/1/event_items/1
  def show
  end

  # GET events/1/event_items/new
  def new
    @event_item = @event.event_items.build
  end

  # GET events/1/event_items/1/edit
  def edit
  end

  # POST events/1/event_items
  def create
    @event_item = @event.event_items.build(event_item_params)

    if @event_item.save
      redirect_to([@event_item.event, @event_item], notice: 'Event item was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT events/1/event_items/1
  def update
    if @event_item.update_attributes(event_item_params)
      redirect_to([@event_item.event, @event_item], notice: 'Event item was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE events/1/event_items/1
  def destroy
    @event_item.destroy

    redirect_to event_event_items_url(@event)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_items
      @event = Event.find(params[:event_id])
    end

    def set_event_item
      @event_item = @event.event_items.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_item_params
      params.require(:event_item).permit(:name, :description, :value, :event_item_type_id)
    end
end
