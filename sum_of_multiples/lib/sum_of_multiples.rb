=begin


P:

Given a natural number and a set of one more other natural numbers,
find the sum of all multiples of the nums in the set that are less than
the first num.

If set of nums not given, used [3,5]


E:


D:


A:
SumOfMultiples calls
  class method `to` that peforms this calc
    auto uses 3,5

  instance method as well.


=end

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(num)
    sum = 0
    3.step(num - 1, 3)  { |num| sum += num }
    5.step(num - 1, 5)  { |num| sum += num unless (num % 3).zero? }
    sum
  end

  def to(num)
    arr = @multiples.each_with_object([]) do |number, arr|
      number.step(num - 1, number) { |int| arr << int }
    end
    arr.uniq.sum
  end
end
