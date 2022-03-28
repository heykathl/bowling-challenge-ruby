# frozen_string_literal: true

class Game
  attr_reader :fallen_pins, :total_score

  def initialize
    @fallen_pins = []
    @total_score = 0
  end

  def roll(first_roll, second_roll)
    raise "10 frames done" if frames_full?
    @fallen_pins << [first_roll, second_roll]
  end

  def score
    @fallen_pins.map.with_index do |frame, index|
      if strike?(frame)
        @fallen_pins[index] = [frame[0], (@fallen_pins[index + 1].sum)]
      elsif spare?(frame)
        @fallen_pins[index] = [frame[0], (frame[1] + (@fallen_pins[index + 1][0]))]
      elsif double_strike?(frame)
        @fallen_pins[index] = [frame[0], ((@fallen_pins[index + 1][0]) + (@fallen_pins[index + 2][0]))]
      end
    end
    total_score
  end

  

 private

  def total_score
    @total_score += @fallen_pins.flatten.inject(:+)
  end

  def frames_full?
    @fallen_pins.count == 10
  end

  def strike?(frame)
    frame[0] == 10
  end

  def spare?(frame)
    frame[0] != 10 && frame.sum == 10 
  end

  def double_strike?(frame)
    frame[0] == 10 && @fallen_pins[index + 1][0] == 10
  end
  # def score_per_frame
  #   @score_per_frame = @pins_per_roll.each_slice(2).map {|num| num.inject(:+) }
  # end

end
