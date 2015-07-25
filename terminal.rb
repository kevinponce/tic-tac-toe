#!/usr/bin/ruby
require_relative './game.rb'
require_relative './string.rb'

game = Game.new
continue_playing = true


def help
  puts 'set player 1 name Enter: "set name 1"'
  puts 'set player 2 name Enter: "set name 2"'

  puts 'get player 1 name Enter: "get name 1"'
  puts 'get player 2 name Enter: "get name 2"'

  puts 'print board positions Enter: "positions"'
  puts 'print Enter: "print"'
  puts 'set position Enter: 0-8'
  puts 'new game Enter: "new game"'

  puts 'get whose turn it is: "turn"'

  puts 'help: "help"'
  puts 'quit: "quit"'
end


puts 'Welcome to Tic Tac Toe'
puts 'Here is a list of commands'
help 

while continue_playing
  cmd = gets.chomp
  if cmd.is_i?
    puts game.set(cmd.to_i)
  elsif cmd == 'set name 1'
    puts 'please enter new name'
    name = gets.chomp
    game.player_1.name = name
  elsif cmd == 'set name 2'
    puts 'please enter new name'
    name = gets.chomp
    game.player_2.name = name
  elsif cmd == 'get name 1'
    puts game.player_1.name
  elsif cmd == 'get name 2'
    puts game.player_2.name
  elsif cmd == 'positions'
    game.board.print_positions
  elsif cmd == 'print'
    game.board.print
  elsif cmd == 'new game'
    puts game.new_game
  elsif cmd == 'turn'
    puts (game.turn == 0 ? "#{game.player_1.name} (X) turn" : "#{game.player_2.name} (O) turn")
  elsif cmd == 'quit'
    continue_playing = false
    puts 'Thanks for playing'
  else
    help
  end
 
  puts " "
end


