class UserMailer < ApplicationMailer
  default from: 'bookings@sahulatservices.herokuapp.com'
   layout "mailer"

  def send_booking(booking)
    @booking = booking
    bcc = 'bilal6342522@gmail.com'

    mail(to: 'sahulatmep@gmail.com',
      bcc: bcc,
      subject: 'Booking Detail')
  end
end