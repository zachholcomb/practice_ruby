class Game
  class BowlingError < ArgumentError; end

  attr_reader :score_card, :current_frame
  
  def initialize
    @score_card = ScoreCard.new
    @current_frame = Frame.new(1)
  end

  def roll(pins)
    raise BowlingError if game_finished?(pins)
    raise BowlingError unless legal_roll?(pins)
    raise BowlingError unless legal_total?(pins)

    if @current_frame.complete? || @current_frame.strike?
      if last_frame?
        set_last_frame(pins)
      else
        re_rack(pins)
      end
    else
      @current_frame.add(pins)
      if last_frame?
        @score_card.frames << @current_frame
      end
    end
  end

  def score
    raise BowlingError unless game_score_ready?

    @score_card.add_up_score
  end

  def game_score_ready?
    if @score_card.frames.length == 10 && @score_card.frames.last.spare?
      @score_card.frames.last.rolls.length == 3
    else
      @score_card.frames.length == 10
    end
  end

  def game_finished?(pins)
   if @score_card.frames.length == 10
     if pins && @score_card.frames.last.rolls.length == 2 && @score_card.frames.last.strike?
        false
     elsif pins && @score_card.frames.last.rolls.length == 2 && @score_card.frames.last.spare?
        false
     elsif pins && @score_card.frames.last.rolls.length == 2
        true
     elsif score_card.frames.last.rolls.length == 3
        true
     end
   end
  end

  def re_rack(pins)
    @score_card.frames << @current_frame
    next_frame = @current_frame.number + 1
    @current_frame = Frame.new(next_frame)
    @current_frame.add(pins)
  end

  def set_last_frame(pins)
    if @current_frame.strike?
      @current_frame.rolls << pins
      if @current_frame.rolls.length == 3
        @score_card.frames << @current_frame
      end
    else
      @score_card.frames.last.add(pins)
    end
  end

  def last_frame?
    @current_frame.number == 10
  end

  def legal_roll?(pins)
    (0..10).to_a.include?(pins)
  end

  def legal_total?(pins)
    return true if @current_frame.rolls.length < 1
    return true if @current_frame.strike? && @current_frame.not_last?

    if @current_frame.not_last?
      return (@current_frame.rolls.first + pins) <= 10
    else
      if @current_frame.strike?
        return true if @current_frame.rolls[1].nil?
        return true if @current_frame.rolls[1] < 10 && (@current_frame.rolls[1] + pins) <= 10
        return true if @current_frame.rolls[0] == 10 && @current_frame.rolls[1] == 10 && pins <= 10
        
        (@current_frame.rolls[1] + pins) <= 10
      elsif @current_frame.spare?
        pins <= 10
      else
        (@current_frame.rolls.sum + pins) <= 10
      end
    end
  end
end

class Frame
  attr_reader :number, :rolls
  attr_accessor :bonus

  def initialize(number)
    @number = number
    @rolls = []
    @bonus = 0
  end

  def add(pins)
    @rolls << pins
  end

  def complete?
    @rolls.length == 2 || strike? 
  end

  def strike?
    @rolls.first == 10
  end

  def not_last?
    @number < 10
  end

  def next_to_last?
    self.number == 9
  end

  def spare?
    @rolls.sum == 10 && @rolls.length == 2
  end

  def last_frame_completed?
    @number == 10 && (@rolls.length == 2 || @rolls.length == 3)
  end

  def last?
    @number == 10
  end
end

class ScoreCard
  attr_accessor :frames

  def initialize
    @frames = []
  end

  def add_up_score
    @frames.reduce(0) do |acc, frame|
      bonus?(frame)
      score = frame.rolls.sum + frame.bonus
      acc += score
      acc
    end
  end

  def bonus?(frame)
    bonus_frame = frames.find { |next_frame| next_frame.number == (frame.number + 1)}
    return if bonus_frame.nil?

    if frame.spare?
      frame.bonus += bonus_frame.rolls.first
    elsif frame.strike? && bonus_frame.strike?
      if frame.next_to_last?
        frame.bonus += bonus_frame.rolls[0..1].sum
      else
        extra = frames.find { |next_frame| next_frame.number == (frame.number + 2)}
        bonus = (bonus_frame.rolls.sum + extra.rolls.first)
        frame.bonus += bonus
      end
    elsif frame.strike? && frame.not_last?
      frame.bonus += bonus_frame.rolls.sum
    end
  end
end

