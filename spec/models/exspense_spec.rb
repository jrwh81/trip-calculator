require 'rails_helper'
require 'faker'

RSpec.describe Exspense, type: :model do

   let(:valid_params) { {name: Faker::Name::name, cost: Faker::Number.decimal(2),
                         trip_id: FactoryGirl.create(:trip).id,
                         traveler_id: FactoryGirl.create(:traveler).id  } }
   let(:invalid_params) { { cost: Faker::Number.decimal(2),
                           trip_id: FactoryGirl.create(:trip).id } }


   context 'creation' do
      it 'will create an exspense with valid params' do
         exspense = Exspense.create(valid_params)
         expect(exspense).to be_valid 
      end

      it 'will not create an exspense with invalid params' do
         exspense = Exspense.create(invalid_params)
         expect(exspense).not_to be_valid 
      end      
   end

   context 'relationships' do
      it { have_one(:trip) }
      it { have_one(:exspense) }
    end         
end