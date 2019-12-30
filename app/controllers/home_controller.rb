class HomeController < ApplicationController
  def index
  end

  def booking
  end

  def appointment
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path
    else
      render :booking
    end
  end


  private
  def booking_params
    params.require(:appointment).permit(:name, :phone, :service, :address)
  end
end
