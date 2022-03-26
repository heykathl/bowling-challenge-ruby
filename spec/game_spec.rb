# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { Game.new }

  # As a player,
  # To keep track of my points
  # I would like to keep a scoreboard which stores the pins I've knocked down per frame
  context "store ko'd pins" do

    it "stores the ko'd pins of the first rolled ball within the first frame" do
      game.roll(2)
      expect(game.pins_per_roll).to eq [2]
    end

    it "stores the ko'd pins of the second rolled ball within the first frame" do
      game.roll(2)
      game.roll(3)
      expect(game.pins_per_roll).to eq [2,3]
      expect(game.pins_per_roll[1]).to eq 3
    end

  # As a player,
  # So that we can determine a winner
  # I would like to calculate the total score of all the pins I've knocked down
  context "calculate score"

    it 'calculates the score of each frame' do
      game.roll(2)
      game.roll(3)
      game.roll(3)
      game.roll(5)
      expect(game.score_per_frame).to eq [5, 8]
    end

    it 'calculates the total score' do
      game.roll(3)
      game.roll(5)
      game.roll(1)
      game.roll(5)
      expect(game.score).to eq 14
    end
    # it "should return a spare if first and second ball in frame knocked down all 10 pins"

    # end

  end
end
