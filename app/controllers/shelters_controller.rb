class SheltersController < ApplicationController 
  before_action :set_shelter, only: %i[ show edit update destroy ]

  # GET /shelters or /shelters.json
  def index
    @shelters = Shelter.all
  end

  # GET /shelters/1 or /shelters/1.json
  def show
  end

  # GET /shelters/new
  def new
    @shelter = Shelter.new
  end

  # GET /shelters/1/edit
  def edit
  end

  # POST /shelters or /shelters.json
  def create
    @shelter = Shelter.new(shelter_params)

    respond_to do |format|
      if @shelter.save
        format.html { redirect_to shelter_url(@shelter), notice: "shelter was successfully created." }
        format.json { render :show, status: :created, location: @shelter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shelter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shelters/1 or /shelters/1.json
  def update
    respond_to do |format|
      if @shelter.update(shelter_params)
        format.html { redirect_to shelter_url(@shelter), notice: "shelter was successfully updated." }
        format.json { render :show, status: :ok, location: @shelter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shelter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shelters/1 or /shelters/1.json
  def destroy
    @shelter.destroy

    respond_to do |format|
      format.html { redirect_to shelters_url, notice: "shelter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelter
      @shelter = Shelter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shelter_params
      params.require(:shelter).permit(:name, :location_address, :contact_info)
    end
end