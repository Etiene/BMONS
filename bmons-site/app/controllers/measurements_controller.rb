class MeasurementsController < ApplicationController
  skip_before_filter :authenticate_user! # we do not need devise authentication here
  http_basic_authenticate_with name: "test", password: "test", except: [:index, :show, :destroy, :edit]
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /measurements
  # GET /measurements.json
  def index
    #getting measurements only that belong to current user account
    beehives = Beehive.where(user_id: current_user.id)
    @measurements = Array.new
    beehives.each do |beehive|
      beehive.sensors.each do |sensor|
      (@measurements << sensor.measurements).flatten!
      end
    end
  end

  # GET /measurements/1
  # GET /measurements/1.json
  def show
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
    @measurement.sensor_id = params[:sensor_id]
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements
  # POST /measurements.json
  def create

    @measurement = Measurement.new(measurement_params)

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to @measurement, notice: 'Measurement was successfully created.' }
        format.json { render json: @measurement.sensor.beehive, status: :created }
      else
        format.html { render :new }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1
  # PATCH/PUT /measurements/1.json
  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to @measurement, notice: 'Measurement was successfully updated.' }
        format.json { render :show, status: :ok, location: @measurement }
      else
        format.html { render :edit }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1
  # DELETE /measurements/1.json
  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to measurements_url, notice: 'Measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measurement_params
      params.require(:measurement).permit(:value, :datetime, :sensor_id)
    end
end
