class ModelKeywordsController < ApplicationController
  before_action :set_model_keyword, only: %i[ show edit update destroy ]

  # GET /model_keywords or /model_keywords.json
  def index
    @model_keywords = ModelKeyword.all
  end

  # GET /model_keywords/1 or /model_keywords/1.json
  def show
  end

  # GET /model_keywords/new
  def new
    @model_keyword = ModelKeyword.new
  end

  # GET /model_keywords/1/edit
  def edit
  end

  # POST /model_keywords or /model_keywords.json
  def create
    @model_keyword = ModelKeyword.new(model_keyword_params)

    respond_to do |format|
      if @model_keyword.save
        format.html { redirect_to @model_keyword, notice: "Model keyword was successfully created." }
        format.json { render :show, status: :created, location: @model_keyword }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @model_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_keywords/1 or /model_keywords/1.json
  def update
    respond_to do |format|
      if @model_keyword.update(model_keyword_params)
        format.html { redirect_to @model_keyword, notice: "Model keyword was successfully updated." }
        format.json { render :show, status: :ok, location: @model_keyword }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @model_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_keywords/1 or /model_keywords/1.json
  def destroy
    @model_keyword.destroy!

    respond_to do |format|
      format.html { redirect_to model_keywords_path, status: :see_other, notice: "Model keyword was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_keyword
      @model_keyword = ModelKeyword.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def model_keyword_params
      params.expect(model_keyword: [ :model_id, :keyword_id ])
    end
end
