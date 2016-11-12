class AirCompany
  def initialize()
    @flights = []
  end

  def add_flight(flight)
    @flights << flight
  end

  # def delete_flight(flight)
  # end

  def profit()
    profit = 0

    @flights.each do |flight|
      flight.tickets.each do |ticket|
        puts " + "
        profit += ticket.price
        puts ticket.type
        puts profit
      end
      puts " - "
      profit -= flight.direction.distance*flight.plane.consumption
      puts profit
    end
    profit
  end
end
