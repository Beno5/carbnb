class BookingsController < ApplicationController
  before_action :find_index, only: %i[show]
  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    @booking.car = @car
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @car = Car.find(params[:car_id])
    @booking.car = @car

    
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def find_index
    @booking = Booking.find(params[:id])
  end

 def review_params
   params.require(:booking).permit(:start_time, :end_time)
 end
end
