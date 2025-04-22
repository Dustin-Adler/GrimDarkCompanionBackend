class EnhancementKeywordsController < ApplicationController
  before_action :set_enhancement_keyword, only: %i[ show edit update destroy ]

  # GET /enhancement_keywords or /enhancement_keywords.json
  def index
    @enhancement_keywords = EnhancementKeyword.all
  end

  # GET /enhancement_keywords/1 or /enhancement_keywords/1.json
  def show
  end

  # GET /enhancement_keywords/new
  def new
    @enhancement_keyword = EnhancementKeyword.new
  end

  # GET /enhancement_keywords/1/edit
  def edit
  end

  # POST /enhancement_keywords or /enhancement_keywords.json
  def create
    @enhancement_keyword = EnhancementKeyword.new(enhancement_keyword_params)

    respond_to do |format|
      if @enhancement_keyword.save
        format.html { redirect_to @enhancement_keyword, notice: "Enhancement keyword was successfully created." }
        format.json { render :show, status: :created, location: @enhancement_keyword }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enhancement_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enhancement_keywords/1 or /enhancement_keywords/1.json
  def update
    respond_to do |format|
      if @enhancement_keyword.update(enhancement_keyword_params)
        format.html { redirect_to @enhancement_keyword, notice: "Enhancement keyword was successfully updated." }
        format.json { render :show, status: :ok, location: @enhancement_keyword }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enhancement_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enhancement_keywords/1 or /enhancement_keywords/1.json
  def destroy
    @enhancement_keyword.destroy!

    respond_to do |format|
      format.html { redirect_to enhancement_keywords_path, status: :see_other, notice: "Enhancement keyword was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enhancement_keyword
      @enhancement_keyword = EnhancementKeyword.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def enhancement_keyword_params
      params.expect(enhancement_keyword: [ :enhancement_id, :keyword_id ])
    end
end
