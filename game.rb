require_relative './board.rb'
require_relative './player.rb'

# game.rb
class Game
  attr_accessor :board, :player_1, :player_2, :turn

  WINNING = []
  WINNING[0] = [0, 1, 2]
  WINNING[1] = [3, 4, 5]
  WINNING[2] = [6, 7, 8]
  WINNING[3] = [0, 3, 6]
  WINNING[4] = [1, 4, 7]
  WINNING[5] = [2, 5, 8]
  WINNING[6] = [0, 4, 8]
  WINNING[7] = [2, 4, 6]

  def initialize
    self.board = Board.new
    self.player_1 = Player.new('Player 1')
    self.player_2 = Player.new('Player 2')
    self.turn = 0
    "#{player_1.name} turn"
  end

  def set(grid_i)
    check_winner = winner
    if !check_winner
      if grid_i > -1 && grid_i < 9
        char = (turn == 0 ? 'X' : 'O')
        if board.set(grid_i, char)
          self.turn = (turn == 0 ? 1 : 0)

          winner_check = winner

          if !winner_check
            "#{turn == 0 ? player_1.name : player_2.name} turn"
          else
            winner_check
          end
        else
          "Spot already taken #{turn == 0 ? player_1.name : player_2.name} try again"
        end
      else
        'Number needs to be between 0 and 8'
      end
    else
      "#{check_winner} Enter 'new game' to play again"
    end
  end

  def winner
    return_message = ''

    WINNING.each do |winning_option|
      case winner_option(winning_option)
      when 1
        return_message = "#{player_1.name} wins!"
      when 2
        return_message = "#{player_2.name} wins!"
      end
    end

    if return_message != ''
      return_message
    else
      if !board.grid.include?(' ')
        'cats game!'
      else
        false
      end
    end
  end

  def new_game
    self.board = Board.new
    self.turn = 0

    "#{player_1.name} turn"
  end

  private

  def winner_option(winning_option)
    player_count = [0, 0, 0]

    winning_option.each do |grid_i|
      if board.grid[grid_i] == 'X'
        player_count[1] += 1
      elsif board.grid[grid_i] == 'O'
        player_count[2] += 1
      end
    end

    player_count.index(3)
  end
end
