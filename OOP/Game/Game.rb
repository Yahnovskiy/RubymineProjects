class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start_game
    while true
      if (not @player1.is_empty_cell?)
        puts "draw"
        break
      else
        @player1.step
        if (@player1.is_win?)
          puts "player1 winner"
          break
        end
      end
      if (not @player2.is_empty_cell?)
        puts "draw"
        break
      else
        @player2.step
        if (@player2.is_win?)
          puts "player2 winner"
          break
        end
    end
  end
end