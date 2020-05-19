class BookingsController < ApplicationController
  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to user_path(current_user)
  end
end
