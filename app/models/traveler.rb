class Traveler < ActiveRecord::Base
   devise :database_authenticatable, :registerable, :omniauthable

   validates   :first_name, :presence => true
   validates   :last_name, :presence => true

   has_many    :trips
   has_many    :exspenses
   belongs_to  :trips

end
