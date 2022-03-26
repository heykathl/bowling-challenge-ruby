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

    
  end
end
