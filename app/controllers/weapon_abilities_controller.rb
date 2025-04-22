class WeaponAbilitiesController < ApplicationController
  before_action :set_weapon_ability, only: %i[ show edit update destroy ]

  # GET /weapon_abilities or /weapon_abilities.json
  def index
    @weapon_abilities = WeaponAbility.all
  end

  # GET /weapon_abilities/1 or /weapon_abilities/1.json
  def show
  end

  # GET /weapon_abilities/new
  def new
    @weapon_ability = WeaponAbility.new
  end

  # GET /weapon_abilities/1/edit
  def edit
  end

  # POST /weapon_abilities or /weapon_abilities.json
  def create
    @weapon_ability = WeaponAbility.new(weapon_ability_params)

    respond_to do |format|
      if @weapon_ability.save
        format.html { redirect_to @weapon_ability, notice: "Weapon ability was successfully created." }
        format.json { render :show, status: :created, location: @weapon_ability }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weapon_ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weapon_abilities/1 or /weapon_abilities/1.json
  def update
    respond_to do |format|
      if @weapon_ability.update(weapon_ability_params)
        format.html { redirect_to @weapon_ability, notice: "Weapon ability was successfully updated." }
        format.json { render :show, status: :ok, location: @weapon_ability }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weapon_ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weapon_abilities/1 or /weapon_abilities/1.json
  def destroy
    @weapon_ability.destroy!

    respond_to do |format|
      format.html { redirect_to weapon_abilities_path, status: :see_other, notice: "Weapon ability was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weapon_ability
      @weapon_ability = WeaponAbility.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def weapon_ability_params
      params.expect(weapon_ability: [ :weapon_id, :ability_id ])
    end
end
