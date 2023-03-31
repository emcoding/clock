# Implement a clock that handles times without dates.
# You should be able to add and subtract minutes to it.
# Two clocks that represent the same time should be equal to each other.

# Maud
# divmod => [quotient, modulus]
# % alleen modulus

class Clock

  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60

  def initialize(hour: 0, minute: 0 )
    @hour = hour % HOURS_PER_DAY
    @minute = minute.divmod(MINUTES_PER_HOUR)
  end

  def to_s
    puts @minute
    @hour += @minute.first if @minute.first > 0
    [@hour, @minute.last].map do |part|
      [format('%02d', part)]
    end.join(":")
  end

  private
  attr_reader :hour, :minute
end
