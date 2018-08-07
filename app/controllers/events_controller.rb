class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    if params[:search_content] || params[:contains_tags].to_a.size > 1
      @events = @events.filter(params.slice(:search_content, :contains_tags))
    end
    if params[:event_type_id]
      @events = @events.where(event_type_id: params[:event_type_id])
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.user = current_user
  end

  # GET /events/1/edit
  def edit
  end

  def save_tags
    @event.add_tags(params)
  end
  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save!
        save_tags
        format.html {redirect_to @event, notice: 'Event was successfully created.'}
        format.json {render :show, status: :created, location: @event}
      else
        format.html {render :new}
        format.json {render json: @event.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        save_tags
        format.html {redirect_to @event, notice: 'Event was successfully updated.'}
        format.json {render :show, status: :ok, location: @event}
      else
        format.html {render :edit}
        format.json {render json: @event.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html {redirect_to events_url, notice: 'Event was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def tag_list
    @event = Event.find(params[:event_id])
    respond_to do |format|
      format.json { render json: @event.tags.map { |p| { id: p.id, name: p.name } } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:name, :description, :event_type_id, :user_id, :tag_list, :tags_list,
                                  coupoms_attributes: [:id, :value, :key, :expiration, :event_id, :coupom_type_id, :used, :_destroy],
                                  event_items_attributes: [:id, :name, :description, :value, :event_item_type_id, :_destroy],
                                  stages_attributes: [:id, :name, :description, :date_start, :date_end, :_destroy],
                                  partnerships_attributes: [:id, :name, :event_id, :institution_id, :_destroy],
    )
  end
end
