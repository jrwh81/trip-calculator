class Trip < ActiveRecord::Base
   validates   :total_cost, :presence => true
   validates   :name, :presence => true
   validates   :description, :presence => true

   has_many    :travelers
   has_many    :exspenses 
end
