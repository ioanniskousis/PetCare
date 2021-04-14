class TreatmentsController < ApplicationController
  before_action :set_treatment, only: %i[ show edit update destroy ]

  # GET /treatments or /treatments.json
  def index
    @pet = Pet.find(params[:pet_id])
    @treatments = @pet.treatments
  end

  # GET /treatments/1 or /treatments/1.json
  def show
  end

  # GET /treatments/new
  def new
    @pet = Pet.find(params[:pet_id])
    @treatment = @pet.treatments.new
  end

  # GET /treatments/1/edit
  def edit
  end

  # POST /treatments or /treatments.json
  def create
    @treatment = Treatment.new(treatment_params)

    respond_to do |format|
      if @treatment.save
        format.html { redirect_to treatment_path(@treatment), notice: "Treatment was successfully created." }
        format.json { render :show, status: :created, location: @treatment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatments/1 or /treatments/1.json
  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to @treatment, notice: "Treatment was successfully updated." }
        format.json { render :show, status: :ok, location: @treatment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatments/1 or /treatments/1.json
  def destroy
    @treatment.destroy
    respond_to do |format|
      format.html { redirect_to treatments_url, notice: "Treatment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment
      @treatment = Treatment.find(params[:id])
      @treatment.treatment_photos.build
      @treatment_photo = @treatment.treatment_photos.new
      @treatment_photo.description = "Default description"
    end

    # Only allow a list of trusted parameters through.
    def treatment_params
      params.require(:treatment).permit(:pet_id, :item, :description, :cost, :location)
    end
end
