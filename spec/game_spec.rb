# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { Game.new }

  # As a player,
  # To keep track of my points
  # I would like to keep a scoreboard which stores the pins I've knocked down per frame
  context "store ko'd pins" do
    before do
      7.times do
        game.roll(2, 2)
      end
      game.roll(0, 10)
      game.roll(10, 0)
      game.roll(2, 2)
    end

    it "stores the ko'd pins of the first rolled ball within the first frame" do
      expect(game.fallen_pins).to eq [[2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [0, 10], [10, 0],[2, 2]]
    end

  end

  # As a player,
  # So that everyone has had an equal chance of playing
  # Every game should only have 10 frames (unless there are bonus rounds)
  context "game over" do
    before do
      7.times do
        game.roll(2, 2)
      end
      game.roll(0, 10)
      game.roll(10, 0)
      game.roll(2, 2)
    end

    it "raise error when attempt to roll past 10 frames" do
      expect{ game.roll(2, 5) }.to raise_error "10 frames done"
    end

  end

  # As a player,
  # I have rolled a strike and spare
  # Therefore I would like the appropriate points and bonuses added to the tally
  context "scoring tally" do

    it "calculates appropriate points for a strike" do
      7.times do
        game.roll(2, 2)
      end
      game.roll(0, 5)
      game.roll(10, 0)
      game.roll(2, 2)
      
      expect(game.score).to eq 51
    end

    it "calculates appropriate points for a spare" do
      7.times do
        game.roll(2, 2)
      end
      game.roll(0, 10)
      game.roll(6, 0)
      game.roll(2, 2)

      expect(game.score).to eq 54
    end

  end
end
