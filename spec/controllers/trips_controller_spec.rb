require 'rails_helper'

RSpec.describe TripsController, type: :controller do

  describe "GET index" do
    it "returns all trips" do
      trip = FactoryGirl.create(:trip)
      get :index, {}
      expect(assigns(:trips)).to eq([trip])
    end
  end

  describe "GET show" do
    it "returns requested trip as @trip" do
      trip = FactoryGirl.create(:trip)
      get :show, {:id => trip.to_param}
      expect(assigns(:trip)).to eq(trip)
    end
  end

  describe "GET new" do
    it "creates a new trip as @trip" do
      get :new, {}
      expect(assigns(:trip)).to be_a_new(Trip)
    end
  end    

  describe "POST add_traveler_to_trip" do
      xit "add a traveler to a trip" do
         traveler_trip = FactoryGirl.create(:travelers_trip)
         post :add_traveler_to_trip, {:trip_id=>traveler_trip.trip_id}
         expect(response).to eq(traveler_trip)
      end
   end
end
