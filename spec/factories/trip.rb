FactoryGirl.define do 
   factory :trip do |f|
      f.name "Test Trip"
      f.description "This is a test description for the trip"
      f.total_cost 583.23
   end
end