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
    @inscription_stage = @event.stages.new(name: "Inscrições", description: "Período de inscrições")
  end

  def new_satellite
    @event = Event.new
    @event.user = current_user
    set_parent
    @events = Event.managed_by(current_user.id).is_not_satellite.without_event(@event.parent.id).has_no_satellites
    @events = @events.uniq
  end

  # GET /events/1/edit
  def edit
  end

  def save_tags
    @event.add_tags(params)
  end

  def set_parent
    if params[:parent_id].present?
      @event.event_id = params[:parent_id]
    end
  end

  def add_moderator
    if params[:event][:user_id].present?
      moderator = Moderator.new(event_id: params[:event_id], user_id: params[:event][:user_id])
      respond_to do |format|
        if moderator.save!
          format.html {redirect_to event_path(params[:event_id]), notice: 'Moderador adicionado com sucesso.'}
        else
          format.html {redirect_to event_path(params[:event_id]), alert: 'Falha ao adicionar moderador.'}
        end
      end
    else
      redirect_to event_path(params[:event_id]), alert: "Erro ao processar sua solicitação. Usuário não foi selecionado."
    end
  end

  def satellite_from_existing_event
    @event = Event.find(params[:parent_id])
    if params[:event][:event_id].present?
      @event_satellite = Event.find(params[:event][:event_id])
      @event_satellite.event_id = @event.id
      respond_to do |format|
        if @event_satellite.save
          format.html {redirect_to @event, notice: 'Evento Satélite adicionado com sucesso.'}
          format.json {render :show, status: :created, location: @event}
        else
          format.html {render :new}
          format.json {render json: @event.errors, status: :unprocessable_entity}
        end
      end
    else
      redirect_to events_path
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
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
      format.json {render json: @event.tags.map {|p| {id: p.id, name: p.name}}}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:name, :location_id, :description, :event_id, :event_type_id, :user_id, :tag_list, :tags_list, :is_direct_inscription, :value,
                                  coupoms_attributes: [:id, :value, :key, :expiration, :event_id, :coupom_type_id, :used, :_destroy],
                                  event_items_attributes: [:id, :name, :description, :value, :event_item_type_id, :location_id, :_destroy,
                                                           responsibles_attributes: [:name, :id, :description, :responsibility_type_id, :_destroy,
                                                           items_attributes: [:id, :attr_name, :attr_value, :_destroy]]],
                                  stages_attributes: [:id, :name, :description, :date_start, :date_end, :_destroy],
                                  partnerships_attributes: [:id, :name, :event_id, :institution_id, :_destroy],
                                  children_attributes: [:child_ids, :_destroy],
                                  moderators_attributes: [:id, :event_id, :user_id, :_destroy]
    )
  end
end
