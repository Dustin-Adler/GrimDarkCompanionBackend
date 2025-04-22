class TerrainLayoutsController < ApplicationController
  before_action :set_terrain_layout, only: %i[ show edit update destroy ]

  # GET /terrain_layouts or /terrain_layouts.json
  def index
    @terrain_layouts = TerrainLayout.all
  end

  # GET /terrain_layouts/1 or /terrain_layouts/1.json
  def show
  end

  # GET /terrain_layouts/new
  def new
    @terrain_layout = TerrainLayout.new
  end

  # GET /terrain_layouts/1/edit
  def edit
  end

  # POST /terrain_layouts or /terrain_layouts.json
  def create
    @terrain_layout = TerrainLayout.new(terrain_layout_params)

    respond_to do |format|
      if @terrain_layout.save
        format.html { redirect_to @terrain_layout, notice: "Terrain layout was successfully created." }
        format.json { render :show, status: :created, location: @terrain_layout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @terrain_layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /terrain_layouts/1 or /terrain_layouts/1.json
  def update
    respond_to do |format|
      if @terrain_layout.update(terrain_layout_params)
        format.html { redirect_to @terrain_layout, notice: "Terrain layout was successfully updated." }
        format.json { render :show, status: :ok, location: @terrain_layout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @terrain_layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terrain_layouts/1 or /terrain_layouts/1.json
  def destroy
    @terrain_layout.destroy!

    respond_to do |format|
      format.html { redirect_to terrain_layouts_path, status: :see_other, notice: "Terrain layout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_terrain_layout
      @terrain_layout = TerrainLayout.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def terrain_layout_params
      params.expect(terrain_layout: [ :name ])
    end
end
