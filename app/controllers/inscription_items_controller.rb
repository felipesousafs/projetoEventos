class InscriptionItemsController < ApplicationController
  before_action :set_inscription_item, only: [:show, :edit, :update, :destroy]

  # GET /inscription_items
  # GET /inscription_items.json
  def index
    @inscription_items = InscriptionItem.all
  end

  # GET /inscription_items/1
  # GET /inscription_items/1.json
  def show
  end

  # GET /inscription_items/new
  def new
    @inscription_item = InscriptionItem.new
  end

  # GET /inscription_items/1/edit
  def edit
  end

  # POST /inscription_items
  # POST /inscription_items.json
  def create
    @inscription_item = InscriptionItem.new(inscription_item_params)

    respond_to do |format|
      if @inscription_item.save
        format.html { redirect_to @inscription_item, notice: 'Inscription item was successfully created.' }
        format.json { render :show, status: :created, location: @inscription_item }
      else
        format.html { render :new }
        format.json { render json: @inscription_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscription_items/1
  # PATCH/PUT /inscription_items/1.json
  def update
    respond_to do |format|
      if @inscription_item.update(inscription_item_params)
        format.html { redirect_to @inscription_item, notice: 'Inscription item was successfully updated.' }
        format.json { render :show, status: :ok, location: @inscription_item }
      else
        format.html { render :edit }
        format.json { render json: @inscription_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inscription_items/1
  # DELETE /inscription_items/1.json
  def destroy
    @inscription_item.destroy
    respond_to do |format|
      format.html { redirect_to inscription_items_url, notice: 'Inscription item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscription_item
      @inscription_item = InscriptionItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inscription_item_params
      params.require(:inscription_item).permit(:name, :value)
    end
end
