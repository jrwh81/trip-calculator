require 'rails_helper'

RSpec.describe Trip, type: :model do

   let(:valid_params) { {name: "Alaska Trip", description: "We went to Alaska", total_cost: 454.23 } }
   let(:invalid_params) { {description: "We went to Alaska", total_cost: "454.23" } }

   context 'creation' do
      it 'will create a trip with valid params' do
         trip = Trip.create(valid_params)
         expect(trip).to be_valid 
      end

      it 'will not create a trip with invalid params' do
         trip = Trip.create(invalid_params)
         expect(trip).not_to be_valid 
      end      
   end

   context 'relationships' do
      it { should have_and_belong_to_many(:travelers) }
      it { should have_many(:exspenses) }
    end       
end
