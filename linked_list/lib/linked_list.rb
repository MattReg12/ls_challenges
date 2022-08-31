# This is to solve the 4th challenge exercise for launch school. It
# includes my structured problem solving approach

=begin

P:
-write a simple linked list implementation
-create a single linked list that may contain a range of data
-reverse list
-convert to array

E:
-next instance method returns next in list
  -wraps around
-push (prepends) /pop/size/to_a
-peek method shows last element in list
  -nil if nothing
-datum returns the element?
-head returns the first? element
-tail? method returns boolean if that element is tail
-from a method --- generates backwards
  - can accept blank array
  -can accept nil
-reverse method returns ll but backwards

D: arrays and ll

A:

- Element class
  -constructor
    -datum
    -previous - auto nil
    -next - auto nil
    -marks the previous elements next as self
    -tail boolean - if none


  - datum getter,
  - next
    returns next element
    if nil previous until tail?

  -previous
      return previous

  -tail? - tail true

- LL class
  constructor - no args
    -current item instance variable --starts @ first

  -size

  -empty?

  -push
    - creates element with datum of argument
    - deal with marking previous and next

  -peek
    -returns datum of last element

  -head
    -last element

  -from_a
    -creates a LL by creating elements in reverse order

  -to_a
    -creates array in reverse order of your elements

=end

require 'pry-byebug'

class Element
  attr_reader :datum, :next

  def initialize(datum, previous_element = nil)
    @datum = datum
    @next = previous_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize
    @head = nil
    @elements = 0
  end

  def size
    @elements
  end

  def empty?
    @elements.zero?
  end

  def push(datum)
    @elements += 1
    previous_head = head
    self.head = Element.new(datum, previous_head)
  end

  def pop
    current = head
    self.head = head.next
    @elements = [0, @elements - 1].max
    current.datum
  end

  def peek
    head.datum if head
  end

  def self.from_a(a)
    return SimpleLinkedList.new unless a

    a.reverse.each_with_object(SimpleLinkedList.new) do |element, list|
      list.push(element)
    end
  end

  def to_a
    current = head
    a = []
    loop do
      a << current.datum if current
      return a if head.nil? || current.tail?
      current = current.next
    end
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  private

  attr_accessor :elements
  attr_writer :head
end
