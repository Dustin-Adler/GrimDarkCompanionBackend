class ModelWeaponsController < ApplicationController
  before_action :set_model_weapon, only: %i[ show edit update destroy ]

  # GET /model_weapons or /model_weapons.json
  def index
    @model_weapons = ModelWeapon.all
  end

  # GET /model_weapons/1 or /model_weapons/1.json
  def show
  end

  # GET /model_weapons/new
  def new
    @model_weapon = ModelWeapon.new
  end

  # GET /model_weapons/1/edit
  def edit
  end

  # POST /model_weapons or /model_weapons.json
  def create
    @model_weapon = ModelWeapon.new(model_weapon_params)

    respond_to do |format|
      if @model_weapon.save
        format.html { redirect_to @model_weapon, notice: "Model weapon was successfully created." }
        format.json { render :show, status: :created, location: @model_weapon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @model_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_weapons/1 or /model_weapons/1.json
  def update
    respond_to do |format|
      if @model_weapon.update(model_weapon_params)
        format.html { redirect_to @model_weapon, notice: "Model weapon was successfully updated." }
        format.json { render :show, status: :ok, location: @model_weapon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @model_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_weapons/1 or /model_weapons/1.json
  def destroy
    @model_weapon.destroy!

    respond_to do |format|
      format.html { redirect_to model_weapons_path, status: :see_other, notice: "Model weapon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_weapon
      @model_weapon = ModelWeapon.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def model_weapon_params
      params.expect(model_weapon: [ :model_id, :weapon_id ])
    end
end
