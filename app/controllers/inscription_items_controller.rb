class InscriptionItemsController < ApplicationController
  before_action :set_inscription_items
  before_action :set_inscription_item, only: [:show, :edit, :update, :destroy]

  # GET inscriptions/1/inscription_items
  def index
    @inscription_items = @inscription.inscription_items
  end

  # GET inscriptions/1/inscription_items/1
  def show
  end

  # GET inscriptions/1/inscription_items/new
  def new
    @inscription_item = @inscription.inscription_items.build
  end

  # GET inscriptions/1/inscription_items/1/edit
  def edit
  end

  # POST inscriptions/1/inscription_items
  def create
    @inscription_item = @inscription.inscription_items.build(inscription_item_params)

    if @inscription_item.save
      redirect_to([@inscription_item.inscription, @inscription_item], notice: 'Inscription item was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT inscriptions/1/inscription_items/1
  def update
    if @inscription_item.update_attributes(inscription_item_params)
      redirect_to([@inscription_item.inscription, @inscription_item], notice: 'Inscription item was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE inscriptions/1/inscription_items/1
  def destroy
    @inscription_item.destroy

    redirect_to inscription_inscription_items_url(@inscription)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscription_items
      @inscription = Inscription.find(params[:inscription_id])
    end

    def set_inscription_item
      @inscription_item = @inscription.inscription_items.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inscription_item_params
      params.require(:inscription_item).permit(:value, :name)
    end
end
