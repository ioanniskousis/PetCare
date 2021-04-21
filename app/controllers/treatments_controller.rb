class TreatmentsController < ApplicationController
  before_action :set_treatment, only: %i[ show edit update destroy ]

  # GET /treatments or /treatments.json
  def index
    if params[:pet_id]
      @pet = Pet.find(params[:pet_id])
      # @user = @pet.owner
      @treatments = @pet.treatments.order("date desc")
    else
      if params[:user_id]
        @user = User.find(params[:user_id])
        @treatments = @user.treatments.order("date desc")
      else
        @treatments = Treatment.all.order("date desc")
      end

    end
    
  end

  # GET /treatments/1 or /treatments/1.json
  def show
  end

  # GET /treatments/new
  def new
    if params[:pet_id]
      @pet = Pet.find(params[:pet_id])
      @user = @pet.owner
      @treatment = @pet.treatments.new
      @treatment.user = @user
    else
      @user = User.find(params[:user_id])
      @treatment = @user.treatments.new
      @treatment.pet_id = 0
    end
  end

  # GET /treatments/1/edit
  def edit
  end

  # POST /treatments or /treatments.json
  def create
    @treatment = Treatment.new(treatment_params)
    @treatment.pet_id = 0 if @treatment.pet_id.nil?

    respond_to do |format|
      if @treatment.save
        if @treatment.pet
          format.html { redirect_to pet_treatments_path(@treatment.pet) }
        else
          format.html { redirect_to treatments_path(user_id: @treatment.user_id) }
        end
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
        if @treatment.pet
          format.html { redirect_to pet_treatments_path(@treatment.pet) }
        else
          format.html { redirect_to treatments_path(user_id: @treatment.user_id) }
        end
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
      params.require(:treatment).permit(:pet_id, :user_id, :date, :item, :description, :cost, :location)
    end
end
