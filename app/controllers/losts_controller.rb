class LostsController < ApplicationController
  before_action :set_lost, only: %i[ show edit update destroy ]

  # GET /losts or /losts.json
  def index
    @losts = Lost.all
  end

  # GET /losts/1 or /losts/1.json
  def show
  end

  # GET /losts/new
  def new
    @isnew = true
    @lost = Lost.new
    @lost.user = current_user
    @lost.resolved = false
  end

  # GET /losts/1/edit
  def edit
  end

  # POST /losts or /losts.json
  def create
    @lost = Lost.new(lost_params)

    respond_to do |format|
      if @lost.save
        format.html { redirect_to edit_lost_path(@lost), notice: "Lost was successfully created." }
        format.json { render :show, status: :created, location: @lost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /losts/1 or /losts/1.json
  def update
    respond_to do |format|
      if @lost.update(lost_params)
        format.html { redirect_to @lost, notice: "Lost was successfully updated." }
        format.json { render :show, status: :ok, location: @lost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /losts/1 or /losts/1.json
  def destroy
    @lost.destroy
    respond_to do |format|
      format.html { redirect_to losts_url, notice: "Lost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lost
      @lost = Lost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lost_params
      params.require(:lost).permit(:comments, :user_id, :resolved)
    end
end
