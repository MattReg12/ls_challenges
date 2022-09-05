# This is to solve the 4th easy exercise for launch school's challenge exercises
# it includes my structure problem solving approach

=begin

P:
-take a word and array of possible anagrams.
-return array with the actual anagrams

E:
Anagram class
  constructor - one arg, the word string
  instance methods:
    -match - takes an array of strings, returns string elements
      that are anagram of instance variable
      -no match returns emtpy array
      -case matters

D: arrays and strings


A:
  -match method
    -feeds array arg elements into anagram helper and returns
      new arr with only true elements
    -helper method anagram?
      -takes a string arg
      -converts to array and sorts
      -is equal to IV


=end

class Anagram
  def initialize(word)
    @word = word.downcase
    @sorted = @word.chars.sort
  end

  def match(possible_anagrams)
    possible_anagrams.select { |word| anagram?(word) }
  end

  def anagram?(possible_anagram)
    return false if @word.casecmp?(possible_anagram)

    @sorted == possible_anagram.downcase.chars.sort
  end
end
