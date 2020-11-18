class CarsController < ApplicationController
  before_action :find_index, only: %i[show destroy]
  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end
  
  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end
  
    def destroy
      @car.destroy
      redirect_to cars_path, notice: 'the car was successfully deleted.'
    end
  
  private

  def find_index
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :price, :fuel_type, :consumption, :category, :seat_number, :transmission, :photo)
  end
end
