class FoundsController < ApplicationController
  before_action :set_found, only: %i[ show edit update destroy ]

  # GET /founds or /founds.json
  def index
    @founds = Found.all
  end

  # GET /founds/1 or /founds/1.json
  def show
  end

  # GET /founds/new
  def new
    @isnew = true
    @found = Found.new
    @found.user = current_user
    @found.resolved = false
  end

  # GET /founds/1/edit
  def edit
    @found_photo = @found.photos.new
  end

  # POST /founds or /founds.json
  def create
    @found = Found.new(found_params)

    respond_to do |format|
      if @found.save
        format.html { redirect_to edit_found_path(@found), notice: "Found was successfully created." }
        format.json { render :show, status: :created, location: @found }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @found.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /founds/1 or /founds/1.json
  def update
    respond_to do |format|
      if @found.update(found_params)
        format.html { redirect_to founds_path, notice: "Found was successfully updated." }
        format.json { render :show, status: :ok, location: @found }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @found.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /founds/1 or /founds/1.json
  def destroy
    @found.destroy
    respond_to do |format|
      format.html { redirect_to founds_url, notice: "Found was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_found
      @found = Found.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def found_params
      params.require(:found).permit(:comments, :resolved, :user_id)
    end
end
