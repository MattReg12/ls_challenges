# This is to solve the 3rd medium exercise of launch school's
# challenge exercises. It include my strutured problem solving
# approach.

=begin

P:
- create a clock without dates
- no built in functionaliy
- 2 clock objects that have the same time are equal (==)

E:
- military clock
- class method at, that takes 1 or 2 args
  creates an new clock instance
  1 arg is hour
  2nd ard is min
  if min > 61, increase hour

instance methods
    + and - take minute args
    +
    - : must incorp backwards.
    to_s  'HH:MM'
    ==
D:
  ints

A:
  create a clock class
    DONE constructor aliased as 'at' takes 2 args,
      hour, min default as 0
      create instance variables
    +  increment by minute args. account for hour changes
    -  decrement by minute args. account for hour changes
    DONE == - minute and hour both equal
    DONE to_s : 'HH:MM'

=end

class Clock
  def initialize(hour, min = 0)
    @hour = hour
    @min = min
  end

  def self.at(hour, min = 0)
    Clock.new(hour, min)
  end

  def +(min)
    hour_change, min_change = min.divmod(60)
    self.hour += hour_change
    self.min += min_change
    self.hour = hour.divmod(24).last
    self
  end

  def -(min)
    hour_change, min_change = min.divmod(60)
    self.hour -= hour_change
    self.min -= min_change
    if self.min.negative?
      self.min += 60
      self.hour -= 1
    end
    self.hour = hour.divmod(24).last
    self
  end

  def ==(other)
    [hour, min] == [other.hour, other.min]
  end

  def to_s
    format('%02d', hour) + ':' + format('%02d', min)
  end

  private

  attr_writer :hour, :min

  protected

  attr_reader :hour, :min
end
