# board.rb
class Board
  attr_accessor :grid

  def initialize
    self.grid = []

    (0..8).each do |grid_i|
      grid[grid_i] = ' '
    end
  end

  def set(grid_i, char)
    if grid[grid_i] == ' '
      grid[grid_i] = char
      return true
    else
      return false
    end
  end

  def print_positions
    p '0|1|2'
    p '3|4|5'
    p '6|7|8'
  end

  def print
    p "#{grid[0]}|#{grid[1]}|#{grid[2]}"
    p "#{grid[3]}|#{grid[4]}|#{grid[5]}"
    p "#{grid[6]}|#{grid[7]}|#{grid[8]}"
  end
end
