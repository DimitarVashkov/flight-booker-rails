class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight][:flight_id])
    @booking = Booking.new
    @passengers = params[:flight][:passengers].to_i
    @passengers.times{ @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      redirect_to flights_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name])
  end


end
