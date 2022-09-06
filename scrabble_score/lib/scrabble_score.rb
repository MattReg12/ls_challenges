# This is to solve the 5th problem of launch school's challenge exercises. It
# included my structured problem solving approach.

=begin

P: write a program that computes the scrabble score for a word.

E:
 -Scrabble class
  -constructor that takes a string with the scrabble word
    -case insensitive
    -score instance method
    -score class method
      -nil returns 0
      -escape chars return 0
      -blank returns 0
      -white space is 0

D: Scrabble class, string, hash?

A:
  -Scrabble class
    -Hash values constants
    -constructor takes a string set to word. converts nil to ''
    -score instance method
      -iterate over each character and run through hash,
        send value to accumulator

=end

class Scrabble
  VALUES = { 'a' => 1, 'e' => 1, 'i' => 1, 'o' => 1, 'u' => 1, 'l' => 1, 'n' => 1,
             'r' => 1, 's' => 1, 't' => 1, 'd' => 2, 'g' => 2, 'b' => 3, 'c' => 3,
             'm' => 3, 'p' => 3, 'f' => 4, 'h' => 4, 'v' => 4, 'w' => 4, 'y' => 4,
             'k' => 5, 'j' => 8, 'x' => 8, 'q' => 10, 'z' => 10 }

  def initialize(word)
    @word = scrub(word)
  end

  def score
    @word.chars.reduce(0) { |sum, letter| sum + VALUES.fetch(letter, 0) }
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  def scrub(word)
    return '' if word.nil?

    word.downcase.delete('^a-z')
  end
end
