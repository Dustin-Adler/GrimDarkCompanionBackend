class SquadLeadersController < ApplicationController
  before_action :set_squad_leader, only: %i[ show edit update destroy ]

  # GET /squad_leaders or /squad_leaders.json
  def index
    @squad_leaders = SquadLeader.all
  end

  # GET /squad_leaders/1 or /squad_leaders/1.json
  def show
  end

  # GET /squad_leaders/new
  def new
    @squad_leader = SquadLeader.new
  end

  # GET /squad_leaders/1/edit
  def edit
  end

  # POST /squad_leaders or /squad_leaders.json
  def create
    @squad_leader = SquadLeader.new(squad_leader_params)

    respond_to do |format|
      if @squad_leader.save
        format.html { redirect_to @squad_leader, notice: "Squad leader was successfully created." }
        format.json { render :show, status: :created, location: @squad_leader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @squad_leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squad_leaders/1 or /squad_leaders/1.json
  def update
    respond_to do |format|
      if @squad_leader.update(squad_leader_params)
        format.html { redirect_to @squad_leader, notice: "Squad leader was successfully updated." }
        format.json { render :show, status: :ok, location: @squad_leader }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @squad_leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squad_leaders/1 or /squad_leaders/1.json
  def destroy
    @squad_leader.destroy!

    respond_to do |format|
      format.html { redirect_to squad_leaders_path, status: :see_other, notice: "Squad leader was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_squad_leader
      @squad_leader = SquadLeader.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def squad_leader_params
      params.expect(squad_leader: [ :leader_id, :squad_id ])
    end
end
