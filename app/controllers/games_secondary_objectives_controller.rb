class GamesSecondaryObjectivesController < ApplicationController
  before_action :set_games_secondary_objective, only: %i[ show edit update destroy ]

  # GET /games_secondary_objectives or /games_secondary_objectives.json
  def index
    @games_secondary_objectives = GamesSecondaryObjective.all
  end

  # GET /games_secondary_objectives/1 or /games_secondary_objectives/1.json
  def show
  end

  # GET /games_secondary_objectives/new
  def new
    @games_secondary_objective = GamesSecondaryObjective.new
  end

  # GET /games_secondary_objectives/1/edit
  def edit
  end

  # POST /games_secondary_objectives or /games_secondary_objectives.json
  def create
    @games_secondary_objective = GamesSecondaryObjective.new(games_secondary_objective_params)

    respond_to do |format|
      if @games_secondary_objective.save
        format.html { redirect_to @games_secondary_objective, notice: "Games secondary objective was successfully created." }
        format.json { render :show, status: :created, location: @games_secondary_objective }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @games_secondary_objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games_secondary_objectives/1 or /games_secondary_objectives/1.json
  def update
    respond_to do |format|
      if @games_secondary_objective.update(games_secondary_objective_params)
        format.html { redirect_to @games_secondary_objective, notice: "Games secondary objective was successfully updated." }
        format.json { render :show, status: :ok, location: @games_secondary_objective }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @games_secondary_objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games_secondary_objectives/1 or /games_secondary_objectives/1.json
  def destroy
    @games_secondary_objective.destroy!

    respond_to do |format|
      format.html { redirect_to games_secondary_objectives_path, status: :see_other, notice: "Games secondary objective was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_games_secondary_objective
      @games_secondary_objective = GamesSecondaryObjective.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def games_secondary_objective_params
      params.expect(games_secondary_objective: [ :game_id, :player_id, :secondary_objective_id ])
    end
end
