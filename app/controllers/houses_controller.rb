class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update]

  def show
    @booking = Booking.new
  end

  def edit
  end

  def update
    if @house.update(house_params)
      redirect_to house_path(@house)
    else
      render :edit
    end
  end

  private

  def set_house
    @house = House.find(params[:id])
  end
end
