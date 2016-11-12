class Flight
  attr_accessor :number, :plane, :direction, :pilots, :stuarts, :tickets
  def initialize(number, plane, direction, pilots, stuarts, tickets)
    @number = number
    @plane = plane
    @direction = direction
    @pilots = pilots
    @stuarts = stuarts
    @tickets = tickets
  end
end