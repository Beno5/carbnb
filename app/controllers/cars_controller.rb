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
    @car = Car.find(params[:id])
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


  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to car_path(@car), notice: 'Car was successfully updated.'
    else
      render :edit
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

  # def user_cars_index
  #   @cars = Car.where(user_id: current_user)
  # end

  # def user_cars_edit
  #   @cars = Car.where(user_id: current_user)
  # end

  # def user_cars_update
  # end
