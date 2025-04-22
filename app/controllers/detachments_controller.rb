class DetachmentsController < ApplicationController
  before_action :set_detachment, only: %i[ show edit update destroy ]

  # GET /detachments or /detachments.json
  def index
    @detachments = Detachment.all
  end

  # GET /detachments/1 or /detachments/1.json
  def show
  end

  # GET /detachments/new
  def new
    @detachment = Detachment.new
  end

  # GET /detachments/1/edit
  def edit
  end

  # POST /detachments or /detachments.json
  def create
    @detachment = Detachment.new(detachment_params)

    respond_to do |format|
      if @detachment.save
        format.html { redirect_to @detachment, notice: "Detachment was successfully created." }
        format.json { render :show, status: :created, location: @detachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @detachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detachments/1 or /detachments/1.json
  def update
    respond_to do |format|
      if @detachment.update(detachment_params)
        format.html { redirect_to @detachment, notice: "Detachment was successfully updated." }
        format.json { render :show, status: :ok, location: @detachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @detachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detachments/1 or /detachments/1.json
  def destroy
    @detachment.destroy!

    respond_to do |format|
      format.html { redirect_to detachments_path, status: :see_other, notice: "Detachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detachment
      @detachment = Detachment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def detachment_params
      params.expect(detachment: [ :name, :description, :army_id ])
    end
end
