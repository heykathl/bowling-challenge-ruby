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

  # As a player,
  # So that we can determine a winner
  # I would like to calculate the total score of all the pins I've knocked down
    it 'calculates the total score' do
      game.roll(3)
      game.roll(5)
      expect(game.score).to eq 8
    end
  end

  # As a player,
  # So that everyone has had an equal chance of playing
  # Every game should only have 10 frames
  context "game over" do

    it "raise error when attempt to roll past 10 frames" do
      20.times do 
        game.roll(2)
      end
      expect{ game.roll(2) }.to raise_error "10 frames done"
    end

  end


end
