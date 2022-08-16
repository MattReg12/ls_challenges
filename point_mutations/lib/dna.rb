# This script is to solve the challenge exercises #2 for launch school and
# include a strucuted solving problem approach

=begin

Problem: -calculate the hamming distance between 2 dna strands
-count the number of differences between 2 dna strands
-if unequal length, compute the differences over the shorter length

E:
-cannot mutate either string inputs

D:
-DNA class
-string

A:
-initialize with 1 instance variable
-instance method hamming distance method (takes 1 input string) and compares it to
internal string
=end

class DNA
  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(strand)
    short, long = [@sequence, strand].sort_by(&:size)
    sum = 0
    short.each_char.with_index do |char, i|
      sum += 1 if char != long[i]
    end
    sum
  end
end
