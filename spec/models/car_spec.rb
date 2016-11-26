require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:car) {FactoryGirl.create(:car)}

  describe 'validations' do
    it { should validate_presence_of(:make) }
    it { should validate_presence_of(:design) }
    it { should validate_presence_of(:year) }
end

  describe 'instance methods' do
    describe '#info' do
      it 'returns the dealership name and the count of cars it currently has' do
        car = Car.create(make: 'Honda', design: 'Civic', year: '2010')
        expect(car.info).to eq("2010 - Honda Civic")
      end
    end
  end

describe 'class methods' do
  describe '.by_car_make' do
    it 'returns the cars ordered by make' do

      d = Dealership.create(name: 'Utah Audi', inventory: '150')
      c0 = Car.create(make: 'toyota', design:'camry', year: '2016', dealership_id: d.id)
      c1 = Car.create(make: 'bmw', design:'douche', year: '2011', dealership_id: d.id)
      c2 = Car.create(make: 'ford', design:'F150', year: '2007', dealership_id: d.id)

      by_car_make = Car.all.by_car_make
      expect(by_car_make[0].make).to eq(c1.make)
      expect(by_car_make[1].make).to eq(c2.make)
      expect(by_car_make[2].make).to eq(c0.make)
      end
    end
  end
end
