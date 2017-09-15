class Trip < ActiveRecord::Base
   validates   :total_cost, :presence => false
   validates   :name, :presence => true
   validates   :description, :presence => true

   has_and_belongs_to_many   :travelers
   has_many    :exspenses 
end
