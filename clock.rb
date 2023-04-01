# Instructions from Exercism:
# Implement a clock that handles times without dates.
# You should be able to add and subtract minutes to it.
# Two clocks that represent the same time should be equal to each other.

# Maud: note to self
# divmod => [quotient, modulus]
# % => alleen modulus

class Clock

  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60

  def initialize(hour: 0, minute: 0 )
    @hour = hour
    @minute = minute
  end

  def to_s
    time.map do |unit|
      [format('%02i', unit)] # 08, #00
    end.join(":")
  end

  def +(other)
    Clock.new(minute: self.minutes + other.minutes).to_s
  end

  def -(other)
    Clock.new(minute: self.minutes - other.minutes).to_s
  end

  def ==(other)
    self.time == other.time
  end

  protected

  def time
    hr, min = minutes_to_time_units
    [ hr.modulo(HOURS_PER_DAY), min ]
  end

  def minutes
    @minute + hour_in_minutes
  end

  private

  def minutes_to_time_units
    minutes.divmod(MINUTES_PER_HOUR) #[8,0]
  end

  def hour_in_minutes
    @hour * MINUTES_PER_HOUR
  end

end


