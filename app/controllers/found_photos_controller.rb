class FoundPhotosController < ApplicationController
  before_action :set_found_photo, only: %i[ show edit update destroy ]

  # GET /found_photos or /found_photos.json
  def index
    @found_photos = FoundPhoto.all
  end

  # GET /found_photos/1 or /found_photos/1.json
  def show
  end

  # GET /found_photos/new
  def new
    @found_photo = FoundPhoto.new
  end

  # GET /found_photos/1/edit
  def edit
  end

  # POST /found_photos or /found_photos.json
  def create
    @found_photo = FoundPhoto.new(found_photo_params)

    respond_to do |format|
      if @found_photo.save
        format.html { redirect_to @found_photo, notice: "Found photo was successfully created." }
        format.json { render :show, status: :created, location: @found_photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @found_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /found_photos/1 or /found_photos/1.json
  def update
    respond_to do |format|
      if @found_photo.update(found_photo_params)
        format.html { redirect_to @found_photo, notice: "Found photo was successfully updated." }
        format.json { render :show, status: :ok, location: @found_photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @found_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /found_photos/1 or /found_photos/1.json
  def destroy
    @found_photo.destroy
    respond_to do |format|
      format.html { redirect_to found_photos_url, notice: "Found photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_found_photo
      @found_photo = FoundPhoto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def found_photo_params
      params.require(:found_photo).permit(:found_id)
    end
end
