class StrategemKeywordsController < ApplicationController
  before_action :set_strategem_keyword, only: %i[ show edit update destroy ]

  # GET /strategem_keywords or /strategem_keywords.json
  def index
    @strategem_keywords = StrategemKeyword.all
  end

  # GET /strategem_keywords/1 or /strategem_keywords/1.json
  def show
  end

  # GET /strategem_keywords/new
  def new
    @strategem_keyword = StrategemKeyword.new
  end

  # GET /strategem_keywords/1/edit
  def edit
  end

  # POST /strategem_keywords or /strategem_keywords.json
  def create
    @strategem_keyword = StrategemKeyword.new(strategem_keyword_params)

    respond_to do |format|
      if @strategem_keyword.save
        format.html { redirect_to @strategem_keyword, notice: "Strategem keyword was successfully created." }
        format.json { render :show, status: :created, location: @strategem_keyword }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @strategem_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strategem_keywords/1 or /strategem_keywords/1.json
  def update
    respond_to do |format|
      if @strategem_keyword.update(strategem_keyword_params)
        format.html { redirect_to @strategem_keyword, notice: "Strategem keyword was successfully updated." }
        format.json { render :show, status: :ok, location: @strategem_keyword }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @strategem_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strategem_keywords/1 or /strategem_keywords/1.json
  def destroy
    @strategem_keyword.destroy!

    respond_to do |format|
      format.html { redirect_to strategem_keywords_path, status: :see_other, notice: "Strategem keyword was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strategem_keyword
      @strategem_keyword = StrategemKeyword.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def strategem_keyword_params
      params.expect(strategem_keyword: [ :strategem_id, :keyword_id ])
    end
end
