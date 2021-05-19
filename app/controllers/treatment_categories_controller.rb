class TreatmentCategoriesController < ApplicationController
  before_action :set_treatment_category, only: %i[ show edit update destroy ]

  # GET /treatment_categories or /treatment_categories.json
  def index
    @treatment_categories = TreatmentCategory.all
  end

  # GET /treatment_categories/1 or /treatment_categories/1.json
  def show
  end

  # GET /treatment_categories/new
  def new
    @treatment_category = TreatmentCategory.new
  end

  # GET /treatment_categories/1/edit
  def edit
  end

  # POST /treatment_categories or /treatment_categories.json
  def create
    @treatment_category = TreatmentCategory.new(treatment_category_params)

    respond_to do |format|
      if @treatment_category.save
        format.html { redirect_to @treatment_category, notice: "Treatment category was successfully created." }
        format.json { render :show, status: :created, location: @treatment_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treatment_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatment_categories/1 or /treatment_categories/1.json
  def update
    respond_to do |format|
      if @treatment_category.update(treatment_category_params)
        format.html { redirect_to @treatment_category, notice: "Treatment category was successfully updated." }
        format.json { render :show, status: :ok, location: @treatment_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatment_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatment_categories/1 or /treatment_categories/1.json
  def destroy
    @treatment_category.destroy
    respond_to do |format|
      format.html { redirect_to treatment_categories_url, notice: "Treatment category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment_category
      @treatment_category = TreatmentCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treatment_category_params
      params.require(:treatment_category).permit(:categoryName, :parentCategory_id, :order)
    end
end
