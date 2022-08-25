# This is to solve the medium challeng #4 exercise of launch school
# it includes my structured problem soliving approach

=begin

P:
-contruct objects that represent a meetup date
-constructor takes a month and year via ints
-given descriptors on the 2nd, 3rd, 4th etc day of the month as strings
-case of descriptors irrelevant
-teenth day

E:
-day method returns a date object
-if date doesnt exist, returns nil

D:

A:
Meetup class
  -constant for strings to day of week
  -constructor that takes a month and day via ints
  -day method
    takes 2 strings,
      -day and ordinal
        -Create a new date object @ first of month.
          -create and store var for lookup against constant for the day
          -create and store var for iterator count on 2nd input
            if not teenth -- loop until day number equals iterator at 0 or month different
            if teenth -- add 12 and iterate until day reached
        -returns date object
        -returns nil if doesnt exist or month different
      return nil unless valid_date?

=end

require 'pry-byebug'

class Meetup
  DAY_NUMBERS = { 'sunday' => 7, 'monday' => 1, 'tuesday' => 2, 'wednesday' => 3,
                  'thursday' => 4, 'friday' => 5, 'saturday' => 6 }

  ORDINAL_TO_INT = { 'first' => 1, 'second' => 2, 'third' => 3, 'fourth' => 4,
                     'fifth' => 5, 'teenth' => 1, 'last' => 1 }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_name, ordinal)
    date = date_object(ordinal)
    int_day = DAY_NUMBERS[day_name.downcase]
    day_count = ORDINAL_TO_INT[ordinal.downcase]
    day_count -= 1 if date.cwday == int_day
    until day_count.zero?
      date += 1
      day_count -= 1 if date.cwday == int_day
    end
    date if date.month == @month
  end

  private

  def date_object(ordinal)
    if ordinal.downcase == 'last'
      Date.new(@year, @month + 1) - 7
    elsif ordinal.downcase == 'teenth'
      Date.new(@year, @month) + 12
    else
      Date.new(@year, @month)
    end
  end
end
