class ModeratorsController < ApplicationController
  before_action :set_moderators
  before_action :set_moderator, only: [:show, :edit, :update, :destroy]

  # GET events/1/moderators
  def index
    @moderators = @event.moderators
  end

  # GET events/1/moderators/1
  def show
  end

  # GET events/1/moderators/new
  def new
    @moderator = @event.moderators.build
  end

  # GET events/1/moderators/1/edit
  def edit
  end

  # POST events/1/moderators
  def create
    @moderator = @event.moderators.build(moderator_params)

    if @moderator.save
      redirect_to([@moderator.event, @moderator], notice: 'Moderator was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT events/1/moderators/1
  def update
    if @moderator.update_attributes(moderator_params)
      redirect_to([@moderator.event, @moderator], notice: 'Moderator was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE events/1/moderators/1
  def destroy
    @moderator.destroy

    redirect_to event_path(@event), alert: "Moderador removido com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moderators
      @event = Event.find(params[:event_id])
    end

    def set_moderator
      @moderator = @event.moderators.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def moderator_params
      params.require(:moderator).permit(:user_id)
    end
end
