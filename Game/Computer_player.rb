
class ComputerPlayer < Player
  def initialize(type, field)
    super(type, field)
  end

  def step
    x, y = @field.get_free_cell
    @field.add_point(x,y,@type)

  end
end