require 'twilio-ruby'
class HomeController < ApplicationController
  def index
  end

  def booking
  end

  def appointment
    @booking = Booking.new(booking_params)
    if @booking.save

      UserMailer.send_booking(@booking).deliver_later

      send_sms(@booking)

      redirect_to booking_path
    else
      render :booking
    end
  end

  private
  def booking_params
    params.require(:appointment).permit(:name, :phone, :service, :address)
  end

  def send_sms booking
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_ACCOUNT_SID'])
    body = 'Booking Detail: -- Name: ' + booking.name + ' -- Phone: ' + booking.phone + ' -- Service: ' + booking.service + ' -- Address: ' + booking.address + ' --'
    message = @client.messages.create(body: body,from: '+19729925765',to: '+923347567120')
  end
end
