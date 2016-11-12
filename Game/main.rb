require './field.rb'
require './human_player.rb'
require './game.rb'
def main
  field = field.new
  player1 = human_player.new("X", field)
  player2 = Computer_player.new("0", field)
  game = game.new(player1, player2)
  game.start_game
end
main