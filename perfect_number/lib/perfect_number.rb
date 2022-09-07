# This is to solve the 6th easy challenge exercise at launch school.
# It includes my structured problem solving approach.

=begin

P:
-Perfect numbers are numbers whose set of divisors all sum to itself
-Abundant numbers are numbers whose set of divisors all sum to greater than itself
-Deficient numbers are numbers whose set of divisors all sum to less than itself
Write a program that can tell the classification of a provided number

E:
Perfect Number class
  -akes one int
  -raises error when passed negative num in classify class method

D: ints, arrays

A:
Perfect Number class
  -class method classify
    takes int
    -find all divisors helper
      iterate 1-square root and add to array
    -sum them then case statement
=end

require 'prime'

module Mathlite
  def self.divisors(int)
    return [1] if int.prime?

    upper_range = Math.sqrt(int).floor
    (2..upper_range).each_with_object([]) do |num, divisors|
      factor, remainder = int.divmod(num)
      if remainder.zero?
        divisors << factor
        divisors << int / factor
      end
    end
  end
end

class PerfectNumber
  def self.classify(int)
    raise StandardError unless int.positive?

    sum = Mathlite.divisors(int).sum + 1
    case sum <=> int
    when 1 then 'abundant'
    when 0 then 'perfect'
    when -1 then 'deficient'
    end
  end
end
