class Direction
  attr_accessor :from, :to, :distance
  def initialize(from, to, distance)
    @from = from
    @to = to
    @distance = distance
  end
end