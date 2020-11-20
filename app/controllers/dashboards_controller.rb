class DashboardsController < ApplicationController
  def show
    @cars = Car.where(user_id: current_user)
  end

  def edit
    @cars = Car.where(user_id: current_user)
  end
end
