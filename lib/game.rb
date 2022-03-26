# frozen_string_literal: true

class Game
  attr_reader :pins_per_roll, :pins_per_frame, :score

  def initialize
    @pins_per_roll = []
    @pins_per_frame = []
    @score = 0
  end

  def roll(pins)
    @pins_per_roll << pins
    @score += pins
  end

  def score_per_frame
    @pins_per_frame = @pins_per_roll.each_slice(2).map {|num| num.inject(:+) }
  end

end
