class MissionRulesController < ApplicationController
  before_action :set_mission_rule, only: %i[ show edit update destroy ]

  # GET /mission_rules or /mission_rules.json
  def index
    @mission_rules = MissionRule.all
  end

  # GET /mission_rules/1 or /mission_rules/1.json
  def show
  end

  # GET /mission_rules/new
  def new
    @mission_rule = MissionRule.new
  end

  # GET /mission_rules/1/edit
  def edit
  end

  # POST /mission_rules or /mission_rules.json
  def create
    @mission_rule = MissionRule.new(mission_rule_params)

    respond_to do |format|
      if @mission_rule.save
        format.html { redirect_to @mission_rule, notice: "Mission rule was successfully created." }
        format.json { render :show, status: :created, location: @mission_rule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mission_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mission_rules/1 or /mission_rules/1.json
  def update
    respond_to do |format|
      if @mission_rule.update(mission_rule_params)
        format.html { redirect_to @mission_rule, notice: "Mission rule was successfully updated." }
        format.json { render :show, status: :ok, location: @mission_rule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mission_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mission_rules/1 or /mission_rules/1.json
  def destroy
    @mission_rule.destroy!

    respond_to do |format|
      format.html { redirect_to mission_rules_path, status: :see_other, notice: "Mission rule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission_rule
      @mission_rule = MissionRule.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mission_rule_params
      params.expect(mission_rule: [ :name, :description ])
    end
end
