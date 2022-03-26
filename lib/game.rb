# frozen_string_literal: true

class Game
  attr_reader :pins_per_roll, :pins_per_frame

  def initialize
    @pins_per_roll = []
    @pins_per_frame = []
  end

  def roll(pins)
    @pins_per_roll << pins
  end

  def score_per_frame
    @pins_per_frame = @pins_per_roll.each_slice(2).map {|num| num.inject(:+) }
  end
end
