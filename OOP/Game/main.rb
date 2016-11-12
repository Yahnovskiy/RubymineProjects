def main
  field = Field.new
  player1 = Human.new("x", field)
  player2 = Computer.new("0", field)
  game = Game.new(player1, player2)
  game.start_game
end
main