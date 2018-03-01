class PassengerMailer < ApplicationMailer
  default from: "from@example.com"

  def booking_email(passenger)
    @passenger = passenger
    @from = @passenger.booking.flight.from_airport.name
    @to = @passenger.booking.flight.to_airport.name
    @date = @passenger.booking.flight.flight_date
    @duration = @passenger.booking.flight.duration
    mail(to: @passenger.email, subject: 'Thanks for booking!')
  end
end
