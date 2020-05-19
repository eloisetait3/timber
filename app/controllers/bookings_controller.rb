class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @house = House.find(params[:house_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.house = House.find(params[:house_id].to_i)
    @booking.user = current_user
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @booking = booking.find(params[:house_id])
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin, :checkout, :guests, :house_id)
  end
end
