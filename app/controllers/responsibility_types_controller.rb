class ResponsibilityTypesController < ApplicationController
  before_action :set_responsibility_type, only: [:show, :edit, :update, :destroy]

  # GET /responsibility_types
  # GET /responsibility_types.json
  def index
    @responsibility_types = ResponsibilityType.all
  end

  # GET /responsibility_types/1
  # GET /responsibility_types/1.json
  def show
  end

  # GET /responsibility_types/new
  def new
    @responsibility_type = ResponsibilityType.new
  end

  # GET /responsibility_types/1/edit
  def edit
  end

  # POST /responsibility_types
  # POST /responsibility_types.json
  def create
    @responsibility_type = ResponsibilityType.new(responsibility_type_params)

    respond_to do |format|
      if @responsibility_type.save
        format.html { redirect_to @responsibility_type, notice: 'Responsibility type was successfully created.' }
        format.json { render :show, status: :created, location: @responsibility_type }
      else
        format.html { render :new }
        format.json { render json: @responsibility_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responsibility_types/1
  # PATCH/PUT /responsibility_types/1.json
  def update
    respond_to do |format|
      if @responsibility_type.update(responsibility_type_params)
        format.html { redirect_to @responsibility_type, notice: 'Responsibility type was successfully updated.' }
        format.json { render :show, status: :ok, location: @responsibility_type }
      else
        format.html { render :edit }
        format.json { render json: @responsibility_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsibility_types/1
  # DELETE /responsibility_types/1.json
  def destroy
    @responsibility_type.destroy
    respond_to do |format|
      format.html { redirect_to responsibility_types_url, notice: 'Responsibility type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responsibility_type
      @responsibility_type = ResponsibilityType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def responsibility_type_params
      params.require(:responsibility_type).permit(:name)
    end
end
