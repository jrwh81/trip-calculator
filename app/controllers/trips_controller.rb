class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trips = Trip.all
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        @new_trip_member = TravelersTrip.new(trip_id: @trip.id, traveler_id: current_traveler.id)
        @new_trip_member.save!
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_traveler_to_trip
    @new_trip_member = TravelersTrip.new(trip_id: params[:id], traveler_id: current_traveler.id)
    @new_trip_member.save!

    respond_to do |format|
      if @new_trip_member.valid?
        format.html { redirect_to root_path, notice: "You've been added to the trip!" }
        format.json { render :show, status: ok, location: @trip }
      else
        format.html { render :show }
        format.json { render json: @trip.errors, status: :unprocessable_entity }        
      end
    end
  end

  def calculate_dues
    @trip = Trip.find(params[:id])
    @traveler_count = @trip.travelers.count
    @total_cost = @trip.total_cost
    @each_contributes = @total_cost / @traveler_count
    @contributions = []
    
    @trip.travelers.each_with_index do |t, i|
      @contributions << [t.user_name, traveler_spent(t, @trip.id)]
    end

    @amounts = []
    @contributions.each_with_index do |con, ind|
      @amounts << con[1]
    end

    @most_paid = @amounts.max
    @contrib_hash = Hash[@contributions]
    @contrib_hash.sort_by {|_key, value| value}
    @paid_most = @contrib_hash.key(@most_paid)
    @contrib_hash.delete(@paid_most)

    render 'trips/show_totals'        
  end

  def show_totals

  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def traveler_spent(t, trip_id)
      @traveler_contribution = 0
      @traveler_contribution.to_f
      t.exspenses.each do |e|
        if e.trip_id == trip_id
          @traveler_contribution += e.cost
        end
      end
      return @traveler_contribution.to_f
    end

    # def determine_final_dues(all_contributions, trip)
    #   dues = []
    #   i = trip.travelers.count
    #   j = 0

    #   while j <= i do

    # end

    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:total_cost, :name, :description)
    end
end
