class BookingsController < ApplicationController
  before_action :find_index, only: %i[show]
  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(review_params)
    @booking.user = @user
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
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:booking).permit(:user_id, :car_id)
  end
end
