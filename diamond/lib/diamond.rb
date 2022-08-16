# This file is to solve the medium 1 challenge exercise of launch school
# it includes my structured problem solving approach

=begin

P:
-take a letter(str)
-output as diamond shape. string
-supplied letter is at its widest point
-all rows except first and last have exactly 2 identical letters
-width == height
-new line at end
-top half is ascending order
-bottom half is desc order


E:
-single letter A returns just A with new line
-supplied letter is mid
-index of the letter * 2 - 1 is the width/height
-midpoint is always start/end given letter
-top half of diamond is reverse of bottom half
-only gen bottom and reverse

D: string,
array of strings

A:
Diamond class
  create alphabet constant

  class method 'make_diamond'
    takes single letter in caps
    returns multiline string
    determine string size -- index @ constant * 2 -1
    create vars to hold i values of start and endpoint of midline
    create remaining alphabet array and iterate through it.
      create string @ string size
      insert letters @ start and end
    join with new line

Questions: what to do with 'even' letters
=end

class Diamond
  ALPHABET = ('A'..'Z').to_a

  attr_reader :shape

  def initialize(point)
    @point = point
    @size = point_size
    @start_i = 0
    @end_i = @size - 1
    @letters = letter_range
  end

  # creates new diamond instance
  # iterates a-argument creating lines based on size
  # diamond object has start and end points that represent
  # the index values of where there letters need to go.
  def self.make_diamond(point)
    return "A\n" if point == 'A'

    diamond = Diamond.new(point)
    diamond.make_shape
  end

  def make_shape
    return @shape if @shape

    @shape = mid_and_bottom
    add_top
    self.shape = shape.flatten.join("\n") + "\n"
  end

  private

  attr_writer :shape
  attr_reader :point, :size, :letters
  attr_accessor :start_i, :end_i

  def mid_and_bottom
    letters.each_with_object([]) do |letter, shape|
      line = ' ' * size
      line[start_i] = letter
      line[end_i] = letter
      shape << line
      self.start_i += 1
      self.end_i -= 1
    end
  end

  def add_top
    shape.prepend(shape[1..-1].reverse)
  end

  def point_size
    (ALPHABET.index(point) + 1) * 2 - 1
  end

  def letter_range
    ('A'..point).to_a.reverse
  end
end
