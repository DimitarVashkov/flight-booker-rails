# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport.delete_all
Flight.delete_all


def random_date
  DateTime.now + (rand * 21)
end

airport_list = [
  %w[Example EXO],
  %w[Nirvana NVA],
  %w[NewYorkZ NYZ],
  %w[Manlester MLR],
  %w[Edinlond ELD]
]

airport_list.each do |name, code|
  Airport.create(name: name, code: code)
end


flight_list = [
    %w[1 2 3700],
    %w[3 2 3000],
    %w[4 5 4000],
    %w[2 5 3700],
    %w[2 3 3700],
    %w[4 2 5500],
    %w[5 2 6700],
    %w[5 1 8900],
    %w[1 5 4500],
    %w[1 4 5600],
    %w[2 4 6000],
    %w[4 2 5000]
]



flight_list.each do |from_id, to_id, duration|
  Flight.create(departure_id: from_id, arrival_id: to_id,
                flight_date: random_date, duration: duration)
end
