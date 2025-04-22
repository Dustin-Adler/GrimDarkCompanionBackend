class DeploymentsController < ApplicationController
  before_action :set_deployment, only: %i[ show edit update destroy ]

  # GET /deployments or /deployments.json
  def index
    @deployments = Deployment.all
  end

  # GET /deployments/1 or /deployments/1.json
  def show
  end

  # GET /deployments/new
  def new
    @deployment = Deployment.new
  end

  # GET /deployments/1/edit
  def edit
  end

  # POST /deployments or /deployments.json
  def create
    @deployment = Deployment.new(deployment_params)

    respond_to do |format|
      if @deployment.save
        format.html { redirect_to @deployment, notice: "Deployment was successfully created." }
        format.json { render :show, status: :created, location: @deployment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deployments/1 or /deployments/1.json
  def update
    respond_to do |format|
      if @deployment.update(deployment_params)
        format.html { redirect_to @deployment, notice: "Deployment was successfully updated." }
        format.json { render :show, status: :ok, location: @deployment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deployments/1 or /deployments/1.json
  def destroy
    @deployment.destroy!

    respond_to do |format|
      format.html { redirect_to deployments_path, status: :see_other, notice: "Deployment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deployment
      @deployment = Deployment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def deployment_params
      params.expect(deployment: [ :name ])
    end
end
