# Implement a clock that handles times without dates.
# You should be able to add and subtract minutes to it.
# Two clocks that represent the same time should be equal to each other.

# Maud
# divmod => [quotient, modulus]
# % alleen modulus

class Clock
  include Comparable

  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60

  def initialize(hour: 0, minute: 0 )
    @hour = hour
    @minute = minute
  end

  def to_s
    time.map do |unit|
      [format('%02d', unit)] # 08, #00
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

  def time
    hr, min = minutes_to_hourly
    [hr % HOURS_PER_DAY, min]
  end

  def minutes
    @minute + hour_in_minutes # 480
  end

  private

  def hour_in_minutes
    @hour * MINUTES_PER_HOUR #480
  end


  def minutes_to_hourly
    minutes.divmod(MINUTES_PER_HOUR) #[8,0]
  end



end


