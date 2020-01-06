require 'twilio-ruby'
class HomeController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def booking
    if session[:booking_sucess].present?
      @sucess_msg = session[:booking_sucess]
      session[:booking_sucess] = nil
    end
  end

  def appointment
    @booking = Booking.new(booking_params)
    if @booking.save

      UserMailer.send_booking(@booking).deliver_later

      send_sms(@booking)
      session[:booking_sucess] = ['Thankyou ', @booking.name, '!. Our team will contact you shortly'].join
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
    account_sid = 'AC1920de72a2f3508949c2c7355d8a278a'
    auth_token = '228da7fae7b513217510dc063fe539a9'

    #@client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_ACCOUNT_SID'])
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    body = 'Booking Detail: -- Name: ' + booking.name + ' -- Phone: ' + booking.phone + ' -- Service: ' + booking.service + ' -- Address: ' + booking.address + ' --'
    message = @client.messages.create(body: body,from: '+19729925765',to: '+923086787497')
  end
end
