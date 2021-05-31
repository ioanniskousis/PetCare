class LostPhotosController < ApplicationController
  before_action :set_lost_photo, only: %i[ show edit update destroy ]

  # GET /lost_photos or /lost_photos.json
  def index
    @lost_photos = LostPhoto.all
  end

  # GET /lost_photos/1 or /lost_photos/1.json
  def show
  end

  # GET /lost_photos/new
  def new
    @lost_photo = LostPhoto.new
  end

  # GET /lost_photos/1/edit
  def edit
  end

  # POST /lost_photos or /lost_photos.json
  def create
    @lost_photo = LostPhoto.new(lost_photo_params)
    @lost = @lost_photo.lost

    respond_to do |format|
      if @lost_photo.save
        format.html { redirect_to edit_lost_path(@lost), notice: "Lost photo was successfully created." }
        format.json { render :show, status: :created, location: @lost_photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lost_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lost_photos/1 or /lost_photos/1.json
  def update
    respond_to do |format|
      if @lost_photo.update(lost_photo_params)
        format.html { redirect_to @lost_photo, notice: "Lost photo was successfully updated." }
        format.json { render :show, status: :ok, location: @lost_photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lost_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lost_photos/1 or /lost_photos/1.json
  def destroy
    @lost_photo.destroy
    respond_to do |format|
      format.html { redirect_to lost_photos_url, notice: "Lost photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lost_photo
      @lost_photo = LostPhoto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lost_photo_params
      params.require(:lost_photo).permit(:lost_id, :photo)
    end
end
