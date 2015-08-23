#!/usr/bin/ruby

require_relative './spec_helper.rb'
require_relative '../player.rb'

describe 'player' do
  describe 'init' do
    it 'name is set to kevin' do
      player = Player.new('kevin')
      expect(player.name).to eq('kevin')
    end

    it 'name is set' do
      player = Player.new('kevin')
      expect(player.name).to_not be_empty
    end
  end
end
