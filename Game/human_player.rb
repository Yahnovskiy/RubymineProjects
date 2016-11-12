require './Player'

class HumanPlayer < Player
  def initialize(type, field)
    super(type, field)
  end

  def step
    # проверка вводных да
    puts "input value x"
    x = gets.to_i
    puts "input value y"
    y = gets.to_i
    @field.add_point(x,y,@type)
    @field.show
  end
end