class CarsController < ApplicationController
  before_action :set_dealership
  before_action :set_car, only: [:edit, :update, :show, :destroy]

  def index
    @cars = @dealership.cars
  end

  def new
    @car = @dealership.cars.new
  end

  def create
    @car = @dealership.cars.new(car_params)
    if @car.save
      flash[:success] = 'Car Created Succesfully!'
      redirect_to dealership_car_path(@dealership, @car)
    else
      flash[:error] = 'Fix errors and try again'
      render :new
    end
  end

  def update
    if @car.update(car_params)
      flash[:success] = 'Car Updated Succesfully!'
      redirect_to dealership_car_path(@dealership, @car)
    else
      flash[:error] = 'Fix errors and try again'
      render :edit
    end
  end

  def destroy
    @car.destroy
    flash[:success] = 'Car Successfully Deleted!'
    redirect_to dealership_cars_path(@dealership)
  end

  def show
  end

  def edit
  end

  private
  def car_params
    params.require(:car).permit(:make, :design, :year)
  end

  def set_dealership
    @dealership = Dealership.find(params[:dealership_id])
  end

  def set_car
    @car = @dealership.cars.find(params[:id])
  end
end
