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
  
  private 

  def find_index
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :price, :fuel_type, :consumption, :category, :seat_number, :transmission,)
  end
end

