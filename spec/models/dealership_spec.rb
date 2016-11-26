require 'rails_helper'

RSpec.describe Dealership, type: :model do
  let(:dealership) {FactoryGirl.create(:dealership)}

    describe 'validations' do
     it { should validate_presence_of(:name) }
     it { should validate_presence_of(:inventory) }
  end

  describe 'associations' do
    it { should have_many :cars }
  end

  describe 'instance methods' do
    describe '#car_count' do # instance method goes with the #
      it 'returns the dealership name and inventory' do
        d = Dealership.create(name: 'SLC Auto', inventory: '400')
        expect(dealership.car_count).to eq("SLC Auto has 400 cars")
      end
    end
  end

  describe 'class methods' do
    describe '.by_name' do
      it 'returns the dealerships ordered by name' do
      # setup code
      d1 = Dealership.create(name: 'SLC Honda', inventory: '300')
      d2 = Dealership.create(name: 'Utah Audi', inventory: '250')
      d3 = Dealership.create(name: 'Clunkerville', inventory: '400')

      # assertion / expectation code
      by_name = Dealership.all.by_name
      expect(by_name[0].name).to eq(d3.name)
      expect(by_name[1].name).to eq(d1.name)
      expect(by_name[2].name).to eq(d2.name)
      end
    end
  end
end
