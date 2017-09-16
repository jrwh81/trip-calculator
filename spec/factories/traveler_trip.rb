FactoryGirl.define do 
   factory :travelers_trip do |f|
      f.trip_id { FactoryGirl.create(:trip).id }
      f.traveler_id { FactoryGirl.create(:traveler).id }
   end
end