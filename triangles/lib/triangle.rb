### This code is to solve the first challenge exercise of launch school @
### https://launchschool.com/exercises/4c45ef4c
### It includes my structured problem solving approach and notes.

=begin

Problem:

Write a program to determine whether a triangle is equilateral, isosceles, or scalene.
  equil - all sides are equal
  isos - 2 sides of same length
  scalene - all different

Explicit Requirements:
  All sides must be > 0.
  Sum of 2 must be greater than 3rd

Examples/Test Cases:
  Implicit Requirements:
    Create triangle class
    kind instance method that returns a string either isos, equil, or scal
    Initialize raises argument error if side !> 0
    Initialize raises argument error if 2 sides !> side 3

Data Structures:
  Triangle class
    3 instance variable sides

Algo:
-Create triangle class
  methods:
    1) initialize with 3 side params.
      private helpers:
      a) method to raise >0 error
      b) method to raise !> 3rd side error
    2) kind method --- return string
      3 private helpers
      a) scalene?
      b) isos? 2 sides same
      c) equil?  all sides ==
=end

class Triangle
  attr_reader :kind

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
    @sides = [@side_a, @side_b, @side_c].sort

    raise ArgumentError, 'All sides must be greater than 0' unless valid_sides?
    raise ArgumentError, '2 sides must be greater than the 3rd' unless valid_sides?

    @kind = classification
  end

  private

  attr_reader :sides

  # Tests whether all sides are > 0 and whether the 2 smallest sides are greater
  # than the largest. Implied logic is that if the 2 smalles are greater than the
  # largest, all other combinations will be valid.
  def valid_sides?
    sides.all?(&:positive?) && (sides[0..1].sum > sides[2])
  end

  # Uses the uniq function to determine how many sides are equal and
  # then classifies based on return value.
  def classification
    case sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else 'scalene'
    end
  end
end
