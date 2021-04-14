class PetImagesController < ApplicationController
  before_action :set_pet_image, only: %i[ show edit update destroy ]

  # GET /pet_images or /pet_images.json
  def index
    @pet_images = PetImage.all
  end

  # GET /pet_images/1 or /pet_images/1.json
  def show
  end

  # GET /pet_images/new
  def new
    @pet_image = PetImage.new
  end

  # GET /pet_images/1/edit
  def edit
  end

  # POST /pet_images or /pet_images.json
  def create
    @pet_image = PetImage.new(pet_image_params)

    respond_to do |format|
      if @pet_image.save
        format.html { redirect_to @pet_image, notice: "Pet image was successfully created." }
        format.json { render :show, status: :created, location: @pet_image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_images/1 or /pet_images/1.json
  def update
    respond_to do |format|
      if @pet_image.update(pet_image_params)
        format.html { redirect_to @pet_image, notice: "Pet image was successfully updated." }
        format.json { render :show, status: :ok, location: @pet_image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_images/1 or /pet_images/1.json
  def destroy
    @pet_image.destroy
    respond_to do |format|
      format.html { redirect_to pet_images_url, notice: "Pet image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_image
      @pet_image = PetImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_image_params
      params.require(:pet_image).permit(:description, :photo, :pet_id)
    end
end
