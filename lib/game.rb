# frozen_string_literal: true

class Game
  attr_reader :pins_per_roll

  def initialize
    @pins_per_roll = []
  end

  def roll(pins)
    @pins_per_roll << pins
  end
end
