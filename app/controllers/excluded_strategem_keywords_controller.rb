class ExcludedStrategemKeywordsController < ApplicationController
  before_action :set_excluded_strategem_keyword, only: %i[ show edit update destroy ]

  # GET /excluded_strategem_keywords or /excluded_strategem_keywords.json
  def index
    @excluded_strategem_keywords = ExcludedStrategemKeyword.all
  end

  # GET /excluded_strategem_keywords/1 or /excluded_strategem_keywords/1.json
  def show
  end

  # GET /excluded_strategem_keywords/new
  def new
    @excluded_strategem_keyword = ExcludedStrategemKeyword.new
  end

  # GET /excluded_strategem_keywords/1/edit
  def edit
  end

  # POST /excluded_strategem_keywords or /excluded_strategem_keywords.json
  def create
    @excluded_strategem_keyword = ExcludedStrategemKeyword.new(excluded_strategem_keyword_params)

    respond_to do |format|
      if @excluded_strategem_keyword.save
        format.html { redirect_to @excluded_strategem_keyword, notice: "Excluded strategem keyword was successfully created." }
        format.json { render :show, status: :created, location: @excluded_strategem_keyword }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @excluded_strategem_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /excluded_strategem_keywords/1 or /excluded_strategem_keywords/1.json
  def update
    respond_to do |format|
      if @excluded_strategem_keyword.update(excluded_strategem_keyword_params)
        format.html { redirect_to @excluded_strategem_keyword, notice: "Excluded strategem keyword was successfully updated." }
        format.json { render :show, status: :ok, location: @excluded_strategem_keyword }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @excluded_strategem_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excluded_strategem_keywords/1 or /excluded_strategem_keywords/1.json
  def destroy
    @excluded_strategem_keyword.destroy!

    respond_to do |format|
      format.html { redirect_to excluded_strategem_keywords_path, status: :see_other, notice: "Excluded strategem keyword was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excluded_strategem_keyword
      @excluded_strategem_keyword = ExcludedStrategemKeyword.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def excluded_strategem_keyword_params
      params.expect(excluded_strategem_keyword: [ :strategem_id, :keyword_id ])
    end
end
