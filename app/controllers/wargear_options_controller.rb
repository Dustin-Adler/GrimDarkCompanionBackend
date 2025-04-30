class WargearOptionsController < ApplicationController
  before_action :set_wargear_option, only: %i[ show edit update destroy ]

  # GET /wargear_options or /wargear_options.json
  def index
    @wargear_options = WargearOption.all
  end

  # GET /wargear_options/1 or /wargear_options/1.json
  def show
  end

  # GET /wargear_options/new
  def new
    @wargear_option = WargearOption.new
  end

  # GET /wargear_options/1/edit
  def edit
  end

  # POST /wargear_options or /wargear_options.json
  def create
    @wargear_option = WargearOption.new(wargear_option_params)

    respond_to do |format|
      if @wargear_option.save
        format.html { redirect_to @wargear_option, notice: "Wargear option was successfully created." }
        format.json { render :show, status: :created, location: @wargear_option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wargear_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wargear_options/1 or /wargear_options/1.json
  def update
    respond_to do |format|
      if @wargear_option.update(wargear_option_params)
        format.html { redirect_to @wargear_option, notice: "Wargear option was successfully updated." }
        format.json { render :show, status: :ok, location: @wargear_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wargear_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wargear_options/1 or /wargear_options/1.json
  def destroy
    @wargear_option.destroy!

    respond_to do |format|
      format.html { redirect_to wargear_options_path, status: :see_other, notice: "Wargear option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wargear_option
      @wargear_option = WargearOption.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def wargear_option_params
      params.expect(wargear_option: [ :model_id, :add_to_model, :weapon_swaps, :for_n_models, :n_models_weapon_swap ])
    end
end
