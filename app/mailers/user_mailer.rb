class UserMailer < ApplicationMailer
  default from: 'bookings@sahulatservices.herokuapp.com'
   layout "mailer"

  def send_booking(booking)
    @booking = booking
    bcc = 'arslan.rao@tintash.com'

    mail(to: 'arslanrao94@gmail.com',
      bcc: bcc,
      subject: 'Booking Detail')
  end
end