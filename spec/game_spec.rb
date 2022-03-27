# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { Game.new }

  before do
    7.times do
      game.roll(2, 2)
    end
    game.roll(2, 10)
    game.roll(10, 2)
    game.roll(2, 2)
  end
  # As a player,
  # To keep track of my points
  # I would like to keep a scoreboard which stores the pins I've knocked down per frame
  context "store ko'd pins" do

    it "stores the ko'd pins of the first rolled ball within the first frame" do
      expect(game.fallen_pins).to eq [[2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 2], [2, 10], [10, 2],[2, 2]]
    end

  end

  # As a player,
  # So that everyone has had an equal chance of playing
  # Every game should only have 10 frames (unless there are bonus rounds)
  context "game over" do

    it "raise error when attempt to roll past 10 frames" do
      expect{ game.roll(2, 5) }.to raise_error "10 frames done"
    end

  end

  # As a player,
  # I have rolled a strike
  # Therefore I would like the appropriate points and bonuses added to the tally
  context "scoring tally" do

    it "calculates appropriate points for a strike" do
      expect(game.total_score).to eq 29
    end
  end

  # As a player,
  # I have rolled a spare
  # Therefore I would like the appropriate points and bonuses added to the tally
end
