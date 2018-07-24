class StagesController < ApplicationController
  before_action :set_stages
  before_action :set_stage, only: [:show, :edit, :update, :destroy]

  # GET events/1/stages
  def index
    @stages = @event.stages
  end

  # GET events/1/stages/1
  def show
  end

  # GET events/1/stages/new
  def new
    @stage = @event.stages.build
  end

  # GET events/1/stages/1/edit
  def edit
  end

  # POST events/1/stages
  def create
    @stage = @event.stages.build(stage_params)

    if @stage.save
      redirect_to([@stage.event, @stage], notice: 'Stage was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT events/1/stages/1
  def update
    if @stage.update_attributes(stage_params)
      redirect_to([@stage.event, @stage], notice: 'Stage was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE events/1/stages/1
  def destroy
    @stage.destroy

    redirect_to event_stages_url(@event)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stages
      @event = Event.find(params[:event_id])
    end

    def set_stage
      @stage = @event.stages.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stage_params
      params.require(:stage).permit(:name, :description, :date_start, :date_end)
    end
end
