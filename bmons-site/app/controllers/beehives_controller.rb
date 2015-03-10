class BeehivesController < ApplicationController
  before_action :set_beehive, only: [:show, :edit, :update, :destroy]

  # GET /beehives
  # GET /beehives.json
  def index
    @beehives = Beehive.all
  end

  # GET /beehives/1
  # GET /beehives/1.json
  def show
  end

  # GET /beehives/new
  def new
    @beehive = Beehive.new
  end

  # GET /beehives/1/edit
  def edit
  end

  # POST /beehives
  # POST /beehives.json
  def create
    @beehive = Beehive.new(beehive_params)

    respond_to do |format|
      if @beehive.save
        format.html { redirect_to @beehive, notice: 'Beehive was successfully created.' }
        format.json { render :show, status: :created, location: @beehive }
      else
        format.html { render :new }
        format.json { render json: @beehive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beehives/1
  # PATCH/PUT /beehives/1.json
  def update
    respond_to do |format|
      if @beehive.update(beehive_params)
        format.html { redirect_to @beehive, notice: 'Beehive was successfully updated.' }
        format.json { render :show, status: :ok, location: @beehive }
      else
        format.html { render :edit }
        format.json { render json: @beehive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beehives/1
  # DELETE /beehives/1.json
  def destroy
    @beehive.destroy
    respond_to do |format|
      format.html { redirect_to beehives_url, notice: 'Beehive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beehive
      @beehive = Beehive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beehive_params
      params.require(:beehive).permit(:name, :position, :mode, :user_id)
    end
end
