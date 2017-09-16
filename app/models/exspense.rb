class Exspense < ActiveRecord::Base

   validates :name, :presence => true
   validates :cost, :presence => true 

   has_one :trip
   has_one :traveler

   after_save  :add_to_trip_cost

   def add_to_trip_cost
      trip = Trip.find(self.trip_id)
      initial_cost = trip.total_cost
      trip.total_cost = initial_cost + self.cost
      trip.save!
      return true
   end
end
