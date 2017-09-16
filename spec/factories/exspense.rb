FactoryGirl.define do 
   factory :exspense do |f|
      f.name "test_exspense"
      f.cost 23.45
      f.trip { FactoryGirl.create(:trip) }
      f.traveler { FactoryGirl.create(:traveler) }
   end
end