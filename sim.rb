#!/usr/bin/ruby
require_relative './game.rb'

game = Game.new
game.player_1.name = 'Kevin'
game.player_2.name = 'Stephanie'

p '*****************************'
p game.new_game
# X|X|X
# O| |O
#  | |

p game.set(0)
p game.set(3)
p game.set(1)
p game.set(5)
p game.set(2)

game.board.print

p '*****************************'
p game.new_game
# X|O|X
# O|O|O
# X| |X
p game.set(0) # X
p game.set(1) # O
p game.set(2) # X
p game.set(3) # O
p game.set(8) # X
p game.set(4) # O
p game.set(6) # X
p game.set(5) # O

game.board.print

p '*****************************'
p game.new_game
# X|O|X
# X|O|O
# O|X|X
p game.set(0) # X
p game.set(1) # O
p game.set(2) # X
p game.set(4) # O
p game.set(3) # X
p game.set(5) # O
p game.set(7) # X
p game.set(6) # O
p game.set(8) # X

game.board.print
