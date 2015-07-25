require_relative './board.rb'
require_relative './player.rb'

class Game
  attr_accessor :board, :player_1, :player_2, :turn

  WINNING = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize
    self.board = Board.new
    self.player_1 = Player.new('Player 1')
    self.player_2 = Player.new('Player 2')
    self.turn = 0
    return "#{self.player_1.name} turn"
  end

  def set(grid_i)
    check_winner = winner
    if !check_winner
      if grid_i > -1 && grid_i < 9
        char = (turn == 0 ? 'X':'O')
        if self.board.set(grid_i,char)
          self.turn = (self.turn == 0 ? 1 : 0)

          winner_check = winner

          if !winner_check
            return "#{self.turn == 0 ? self.player_1.name : self.player_2.name} turn"
          else
            return winner_check
          end
        else
          return "Spot already taken #{self.turn == 0 ? self.player_1.name : self.player_2.name} try again"
        end
      else
        return "Number needs to be between 0 and 8"
      end
    else
      return "#{check_winner} Enter 'new game' to play again"
    end
  end

  def winner
    return_message = ''

    WINNING.each do |winning_option|
      player_1_count = 0
      player_2_count = 0

      winning_option.each do |grid_i|

        if self.board.grid[grid_i] == 'X'
          player_1_count += 1
        elsif self.board.grid[grid_i] == 'O'
          player_2_count += 1
        end
      end

      if player_1_count == 3
        return_message = "#{self.player_1.name} wins!"
      elsif player_2_count == 3
        return_message = "#{self.player_2.name} wins!"
      end
    end

    if return_message != ''
      return return_message
    else
      if !self.board.grid.include?(' ')
        return 'cats game!'
      else
        return false
      end 
    end
  end

  def new_game
    self.board = Board.new
    self.turn = 0

    return "#{self.player_1.name} turn"
  end
end
