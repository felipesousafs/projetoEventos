class EventItemTypesController < ApplicationController
  before_action :set_event_item_type, only: [:show, :edit, :update, :destroy]

  # GET /event_item_types
  # GET /event_item_types.json
  def index
    @event_item_types = EventItemType.all
  end

  # GET /event_item_types/1
  # GET /event_item_types/1.json
  def show
  end

  # GET /event_item_types/new
  def new
    @event_item_type = EventItemType.new
  end

  # GET /event_item_types/1/edit
  def edit
  end

  # POST /event_item_types
  # POST /event_item_types.json
  def create
    @event_item_type = EventItemType.new(event_item_type_params)

    respond_to do |format|
      if @event_item_type.save
        format.html { redirect_to @event_item_type, notice: 'Event item type was successfully created.' }
        format.json { render :show, status: :created, location: @event_item_type }
      else
        format.html { render :new }
        format.json { render json: @event_item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_item_types/1
  # PATCH/PUT /event_item_types/1.json
  def update
    respond_to do |format|
      if @event_item_type.update(event_item_type_params)
        format.html { redirect_to @event_item_type, notice: 'Event item type was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_item_type }
      else
        format.html { render :edit }
        format.json { render json: @event_item_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_item_types/1
  # DELETE /event_item_types/1.json
  def destroy
    @event_item_type.destroy
    respond_to do |format|
      format.html { redirect_to event_item_types_url, notice: 'Event item type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_item_type
      @event_item_type = EventItemType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_item_type_params
      params.require(:event_item_type).permit(:name)
    end
end
