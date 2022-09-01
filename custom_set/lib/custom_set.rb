# This is to solve launch school medium challenge #6. It includes my
# structured problem solving approach.

=begin

P: Create a custom set type
-behaves like a set of unique elements that can be manipulated in well defined ways
-for simplicity, all element of this set are numbers


E:
CustomSet class
  -constructor takes optional array arg
    -uniq elements only saved

  **instance methods**
  -empty?
  -contains? like includes
  -subset? method
    -empty set is a subset of of non empty.
    -empty set is a subset of other empty as well
    -compares sets, protected?
    -does argument contain all elements of caller
  -disjoint?
    -not sure yet
  -eql?
    -are elements all the same
  -add
  -==
    same as eql
  -intersection
    -returns set object with same elements
  -difference
    -returns set object with caller elements not in arg
  -union
    -works how you would think

D

A

=end

class CustomSet
  attr_reader :elements

  def initialize(*args)
    @elements = args.flatten.uniq
  end

  def empty?
    elements.empty?
  end

  def contains?(element)
    elements.include?(element)
  end

  def subset?(other)
    elements.all? { |element| other.elements.include?(element) }
  end

  def disjoint?(other)
    elements.none? { |element| other.elements.include?(element) }
  end

  def eql?(other)
    elements.sort == other.elements.sort
  end

  alias_method :==, :eql?

  def add(element)
    elements << element unless elements.include?(element)
    self
  end

  def intersection(other)
    intersection = elements & other.elements
    CustomSet.new(intersection)
  end

  def difference(other)
    difference = elements - other.elements
    CustomSet.new(difference)
  end

  def union(other)
    union = (elements + other.elements).uniq
    CustomSet.new(union)
  end
end
