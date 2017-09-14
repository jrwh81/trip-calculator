class CreateTravelersTrips < ActiveRecord::Migration
  def change
    create_table :travelers_trips do |t|
      t.integer :trip_id
      t.integer :traveler_id

      t.timestamps null: false
    end
  end
end
