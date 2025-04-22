class StrategemsController < ApplicationController
  before_action :set_strategem, only: %i[ show edit update destroy ]

  # GET /strategems or /strategems.json
  def index
    @strategems = Strategem.all
  end

  # GET /strategems/1 or /strategems/1.json
  def show
  end

  # GET /strategems/new
  def new
    @strategem = Strategem.new
  end

  # GET /strategems/1/edit
  def edit
  end

  # POST /strategems or /strategems.json
  def create
    @strategem = Strategem.new(strategem_params)

    respond_to do |format|
      if @strategem.save
        format.html { redirect_to @strategem, notice: "Strategem was successfully created." }
        format.json { render :show, status: :created, location: @strategem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @strategem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strategems/1 or /strategems/1.json
  def update
    respond_to do |format|
      if @strategem.update(strategem_params)
        format.html { redirect_to @strategem, notice: "Strategem was successfully updated." }
        format.json { render :show, status: :ok, location: @strategem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @strategem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strategems/1 or /strategems/1.json
  def destroy
    @strategem.destroy!

    respond_to do |format|
      format.html { redirect_to strategems_path, status: :see_other, notice: "Strategem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strategem
      @strategem = Strategem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def strategem_params
      params.expect(strategem: [ :id, :name, :cost, :when, :target, :effect, :restrictions, :detachment_id ])
    end
end
