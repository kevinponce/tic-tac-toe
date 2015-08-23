#!/usr/bin/ruby

require_relative './spec_helper.rb'
require_relative '../board.rb'

describe 'board' do
  describe 'init' do
    it 'grid is not empty' do
      board = Board.new
      expect(board.grid).to_not be_empty
    end

    it 'grid length is 9' do
      board = Board.new
      expect(board.grid.length).to eq(9)
    end

    it 'grid index 0 is empty string' do
      board = Board.new
      expect(board.grid[0]).to eq(' ')
    end

    it 'grid index 8 is empty string' do
      board = Board.new
      expect(board.grid[8]).to eq(' ')
    end
  end

  describe 'set' do
    before :each do
      @board = Board.new
    end

    it 'successful' do
      expect(@board.set(0, 'X')).to be_truthy
    end

    it 'successful' do
      @board.set(0, 'O')
      expect(@board.set(0, 'X')).to be_falsey
    end
  end
end
