class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_index, only: %i[show destroy]
  def index
    if params[:query].present?
      @cars = Car.where("model ILIKE ?", "%#{params[:query]}%")
      @markers = @cars.geocoded.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude,
          
        }
      end
      
    else
      @cars = Car.all
      @markers = @cars.geocoded.map do |car|
        {
          lat: car.latitude,
          lng: car.longitude
         
        }
      end
    end
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
    params.require(:car).permit(:model, :price, :fuel_type, :consumption, :category, :seat_number, :transmission, :photo, :address)
  end
end
