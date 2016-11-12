class HumanPlayer < Player
  def initialize(type, field)
    super(type, field)

  end
  def step
    puts "input x"
    x = gets.to_i
    puts "input y"
    y = gets.to_i
    @field.add_point(x,y, @type)
  end
end