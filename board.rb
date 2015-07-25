class Board
  attr_accessor :grid

  def initialize
    self.grid = []

    for grid_i in 0..8
      self.grid[grid_i] = ' '
    end
  end

  def set(grid_i,char)
    if self.grid[grid_i] == ' '
      self.grid[grid_i] = char
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
    p "#{self.grid[0]}|#{self.grid[1]}|#{self.grid[2]}"
    p "#{self.grid[3]}|#{self.grid[4]}|#{self.grid[5]}"
    p "#{self.grid[6]}|#{self.grid[7]}|#{self.grid[8]}"
  end
end
