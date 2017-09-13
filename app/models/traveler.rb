class Traveler < ActiveRecord::Base
   devise :database_authenticatable, :registerable, :confirmable, :recoverable
   
end
