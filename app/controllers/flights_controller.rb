class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map{ |u| [ u.name, u.id ] }
    @passenger_options = (1..4).map{|u| u}
    @date_options = Flight.all.order(:flight_date).map{|u| event_date_formatted(u.flight_date)}
  end
end

def event_date_formatted(date)
  date.strftime("%m/%d/%Y")
end