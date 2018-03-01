class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport', foreign_key: 'departure_id'
  belongs_to :to_airport, class_name: 'Airport', foreign_key: 'arrival_id'

  def self.search(params)
    if params[:departure_id].present?
      date = params[:date].to_date
      Flight.where(departure_id: params[:departure_id], arrival_id: params[:arrival_id],
                   flight_date: date.beginning_of_day..date.end_of_day).includes(:from_airport,:to_airport)
    else
      Flight.none
    end

  end

  def self.get_dates
    pluck(:flight_date).sort.map{ |d| [ d.strftime("%m/%d/%Y"), d.to_date] }.uniq
  end

end
