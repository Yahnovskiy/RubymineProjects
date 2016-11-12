require './air_company.rb'
require './flight.rb'
require './plane.rb'
require './pilot.rb'
require './stuart.rb'
require './ticket.rb'
require './direction.rb'


def main()
  wizzAir = AirCompany.new()

#create a team
  pilot1 = Pilot.new("Vasya", 100)
  pilot2 = Pilot.new("Petya", 150)
  stuart1 = Stuart.new("Ivan",20)
  stuart2 = Stuart.new("Oleg",40)
# create a planes
  plane1 = Plane.new("boing437", 200, 10)
  plane2 = Plane.new("Jet", 25, 1
  )
# create the directions
  direction1 = Direction.new("Kiev", "London", 1500)
  direction2 = Direction.new("Dubai", "Berlin", 2500)
# creat tickets

  ticket1 = Ticket.new("Metrofan", 300, "ecomon")
  ticket1_array = []
  for i in (0...plane1.places)
    ticket1_array << ticket1

    # puts "ticket1 after change = #{ticket1}"
  end

  ticket2 = Ticket.new("Mark", 700, "bussiness")
  ticket2_array = []
  for i in (1...plane2.places)
    ticket2_array << ticket2
  end
# crud flight
  flight1 = Flight.new("e123f", plane1, direction1, [pilot1], [stuart1], ticket1_array)
  flight2 = Flight.new("gj568", plane2, direction2, [pilot2], [stuart2], ticket2_array)

  wizzAir.add_flight(flight1)
  wizzAir.add_flight(flight2)

  puts wizzAir.profit()
  # puts "flight1 = #{flight1}"
end

main
# sadasdfsf