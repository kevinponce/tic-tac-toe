#!/usr/bin/ruby

require_relative './spec_helper.rb'
require_relative '../game.rb'

describe 'game' do 
  describe 'init' do 
    it 'board is set' do 
      game = Game.new
      expect(game.board).to_not be_nil
    end

    it 'player 1 set' do 
      game = Game.new
      expect(game.player_1).to_not be_nil
    end

    it 'player 2 set' do 
      game = Game.new
      expect(game.player_2).to_not be_nil
    end

    it 'turn is 0' do 
      game = Game.new
      expect(game.turn).to eq(0)
    end
  end

  describe 'set' do
    before :each do
      @game = Game.new
    end

    it 'is true' do
      allow(@game.board).to receive(:set).with(0,'X').and_return(true)
      allow(@game).to receive(:winner).and_return(false)

      expect(@game.set(0)).to be_truthy
    end
 
    it 'is false' do
      allow(@game.board).to receive(:set).with(3,'X').and_return(true)
      allow(@game.board).to receive(:set).with(3,'O').and_return(false)
      allow(@game).to receive(:winner).and_return(false)
      @game.set(3)
      expect(@game.set(3)).to eq("Spot already taken #{@game.player_2.name} try again")
    end

    it 'number to low' do
      expect(@game.set(-1)).to eq("Number needs to be between 0 and 8")
    end

    it 'number to high' do
      expect(@game.set(9)).to eq("Number needs to be between 0 and 8")
    end

   it 'turn is 1' do
      allow(@game.board).to receive(:set).with(5,'X').and_return(true)
      allow(@game).to receive(:winner).and_return(false)
      @game.set(5)
      expect(@game.turn).to eq(1)
    end 

   it 'turn is 0' do
      allow(@game.board).to receive(:set).with(0,'X').and_return(true)
      allow(@game.board).to receive(:set).with(1,'O').and_return(true)
      allow(@game).to receive(:winner).and_return(false)
      @game.set(0)
      @game.set(1)
      expect(@game.turn).to eq(0)
    end 
  end

  describe 'winner' do 
    before :each do 
      @game = Game.new
    end

    it 'not finsihed' do
      expect(@game.winner).to be_falsey
    end

    it 'Player 1 wins' do
      message = "#{@game.player_1.name} wins!"
      @game.board.grid[0] = 'X'
      @game.board.grid[1] = 'X'
      @game.board.grid[2] = 'X'

      expect(@game.winner).to eq(message)
    end

    it 'Player 2 wins' do
      message = "#{@game.player_2.name} wins!"
      @game.board.grid[0] = 'O'
      @game.board.grid[3] = 'O'
      @game.board.grid[6] = 'O'

      expect(@game.winner).to eq(message)
    end

    it 'cats game' do
      message = "cats game!"
      @game.board.grid[0] = 'X'
      @game.board.grid[1] = 'O'
      @game.board.grid[2] = 'X'

      @game.board.grid[3] = 'X'
      @game.board.grid[4] = 'X'
      @game.board.grid[5] = 'O'

      @game.board.grid[6] = 'O'
      @game.board.grid[7] = 'X'
      @game.board.grid[8] = 'O'

      expect(@game.winner).to eq(message)
    end
  end

  describe 'new_game' do 
    before :each do 
      @game = Game.new
    end
    
    it 'board is set' do 
      @game.new_game
      expect(@game.board).to_not be_nil
    end

    it 'board grid 0 is ""' do 
      @game.board.grid[0] = 'X'
      @game.new_game
      expect(@game.board.grid[0]).to eq(' ')
    end

    it 'turn is 0' do 
      @game.turn = 1
      @game.new_game
      expect(@game.turn).to eq(0)
    end

   it 'turn is 0' do 
      @game.turn = 1
      @game.new_game
      expect(@game.new_game).to eq("#{@game.player_1.name} turn")
    end   
  end
end
