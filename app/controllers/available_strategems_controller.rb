class AvailableStrategemsController < ApplicationController
  before_action :set_available_strategem, only: %i[ show edit update destroy ]

  # GET /available_strategems or /available_strategems.json
  def index
    @available_strategems = AvailableStrategem.all
  end

  # GET /available_strategems/1 or /available_strategems/1.json
  def show
  end

  # GET /available_strategems/new
  def new
    @available_strategem = AvailableStrategem.new
  end

  # GET /available_strategems/1/edit
  def edit
  end

  # POST /available_strategems or /available_strategems.json
  def create
    @available_strategem = AvailableStrategem.new(available_strategem_params)

    respond_to do |format|
      if @available_strategem.save
        format.html { redirect_to @available_strategem, notice: "Available strategem was successfully created." }
        format.json { render :show, status: :created, location: @available_strategem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @available_strategem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /available_strategems/1 or /available_strategems/1.json
  def update
    respond_to do |format|
      if @available_strategem.update(available_strategem_params)
        format.html { redirect_to @available_strategem, notice: "Available strategem was successfully updated." }
        format.json { render :show, status: :ok, location: @available_strategem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @available_strategem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /available_strategems/1 or /available_strategems/1.json
  def destroy
    @available_strategem.destroy!

    respond_to do |format|
      format.html { redirect_to available_strategems_path, status: :see_other, notice: "Available strategem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_available_strategem
      @available_strategem = AvailableStrategem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def available_strategem_params
      params.expect(available_strategem: [ :model_id, :strategem_id ])
    end
end
