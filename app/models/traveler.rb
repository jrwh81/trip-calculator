class Traveler < ActiveRecord::Base
   devise :database_authenticatable, :registerable, :omniauthable

   validates   :user_name, :presence => true
   validates_uniqueness_of :user_name

   has_and_belongs_to_many   :trips
   has_many    :exspenses
   has_many    :friends, foreign_key: "friend_id", class_name: "Traveler"


end
