class TreatmentPhotosController < ApplicationController
  before_action :set_treatment_photo, only: %i[ show edit update destroy ]

  # GET /treatment_photos or /treatment_photos.json
  def index
    @treatment_photos = TreatmentPhoto.all
  end

  # GET /treatment_photos/1 or /treatment_photos/1.json
  def show
  end

  # GET /treatment_photos/new
  def new
    @treatment_photo = TreatmentPhoto.new
  end

  # GET /treatment_photos/1/edit
  def edit
  end

  # POST /treatment_photos or /treatment_photos.json
  def create
    @treatment_photo = TreatmentPhoto.new(treatment_photo_params)

    respond_to do |format|
      if @treatment_photo.save
        format.html { redirect_to treatment_path(@treatment_photo.treatment_id), notice: "Treatment photo was successfully created." }
        format.json { render :show, status: :created, location: @treatment_photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treatment_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatment_photos/1 or /treatment_photos/1.json
  def update
    respond_to do |format|
      if @treatment_photo.update(treatment_photo_params)
        format.html { redirect_to edit_treatment_photo_path(@treatment_photo), notice: "Treatment photo was successfully updated." }
        format.json { render :show, status: :ok, location: @treatment_photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatment_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatment_photos/1 or /treatment_photos/1.json
  def destroy
    @treatment = @treatment_photo.treatment
    @treatment_photo.destroy
    respond_to do |format|
      format.html { redirect_to treatment_path(@treatment), notice: "Treatment photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment_photo
      @treatment_photo = TreatmentPhoto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treatment_photo_params
      params.require(:treatment_photo).permit(:description, :photo, :treatment_id)
    end
end
