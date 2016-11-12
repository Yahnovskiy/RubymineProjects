class Plane
  attr_reader :type, :places
  attr_accessor :consumption
  def initialize(type, places, consumption)
    @type = type
    @places = places
    @consumption = consumption # $ per 1 km
  end
end