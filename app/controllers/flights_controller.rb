class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map{ |u| [ u.name, u.id ] }
    @passenger_options = (1..4).map{|u| u}
    @date_options = Flight.get_dates
    @passengers = params[:passengers]
    @flights = Flight.search(params)
  end
end
