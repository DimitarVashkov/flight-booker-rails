class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight][:flight_id])
    @passengers = params[:flight][:passengers].to_i
  end
end
