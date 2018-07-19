class CoupomTypesController < ApplicationController
  before_action :set_coupom_type, only: [:show, :edit, :update, :destroy]

  # GET /coupom_types
  # GET /coupom_types.json
  def index
    @coupom_types = CoupomType.all
  end

  # GET /coupom_types/1
  # GET /coupom_types/1.json
  def show
  end

  # GET /coupom_types/new
  def new
    @coupom_type = CoupomType.new
  end

  # GET /coupom_types/1/edit
  def edit
  end

  # POST /coupom_types
  # POST /coupom_types.json
  def create
    @coupom_type = CoupomType.new(coupom_type_params)

    respond_to do |format|
      if @coupom_type.save
        format.html { redirect_to @coupom_type, notice: 'Coupom type was successfully created.' }
        format.json { render :show, status: :created, location: @coupom_type }
      else
        format.html { render :new }
        format.json { render json: @coupom_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupom_types/1
  # PATCH/PUT /coupom_types/1.json
  def update
    respond_to do |format|
      if @coupom_type.update(coupom_type_params)
        format.html { redirect_to @coupom_type, notice: 'Coupom type was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupom_type }
      else
        format.html { render :edit }
        format.json { render json: @coupom_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupom_types/1
  # DELETE /coupom_types/1.json
  def destroy
    @coupom_type.destroy
    respond_to do |format|
      format.html { redirect_to coupom_types_url, notice: 'Coupom type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupom_type
      @coupom_type = CoupomType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupom_type_params
      params.require(:coupom_type).permit(:name)
    end
end
