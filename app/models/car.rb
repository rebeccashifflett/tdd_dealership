class Car < ApplicationRecord
  belongs_to :dealership
  validates_presence_of :make, :design, :year

  def new_car
    Car.create( make: 'Audi', design: 'A4', year:'2005')
  end

  def self.by_car_make
    order(:make)
  end

  def info
    "#{year} - #{make} #{design}"
  end 
end
