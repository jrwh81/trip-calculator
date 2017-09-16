require 'rails_helper'
require 'faker'

RSpec.describe Traveler, type: :model do

   let(:valid_params) { {user_name: Faker::Name::name } }
   let(:invalid_params) { {user_name: '' } }


   context 'creation' do
      it 'will create a traveler with valid params' do
         traveler = Traveler.create(valid_params)
         expect(traveler).to be_valid 
      end

      it 'will not create a traveler with invalid params' do
         traveler = Traveler.create(invalid_params)
         expect(traveler).not_to be_valid 
      end      
   end

   context 'relationships' do
      it { should have_and_belong_to_many(:trips) }
      it { should have_many(:exspenses) }
    end         
end
