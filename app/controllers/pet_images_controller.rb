class PetImagesController < ApplicationController
  before_action :set_pet_image, only: %i[ show edit update destroy ]

  # GET /pet_images or /pet_images.json
  def index
    if params[:pet_id]
      @pet = Pet.find(params[:pet_id])
      @pet_images = @pet.pet_images
    else
      @pet_images = PetImage.all
    end
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
        pet = @pet_image.pet

        format.html { redirect_to pet_path(pet) }
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
        format.html { redirect_to edit_pet_image_path(@pet_image) }
        format.json { render :show, status: :ok, location: @pet_image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_images/1 or /pet_images/1.json
  def destroy
    @pet = Pet.find(params[:pet_id]) if params[:pet_id]
    @pet_image.destroy
    if params[:pet_id]
      respond_to do |format|
        format.html { redirect_to pet_path(@pet) }
        format.json { head :no_content }
      end
    else
      redirect_to pet_images_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_image
      @pet_image = PetImage.find(params[:id])
      @pet = @pet_image.pet
    end

    # Only allow a list of trusted parameters through.
    def pet_image_params
      params.require(:pet_image).permit(:description, :photo, :pet_id)
    end
end
