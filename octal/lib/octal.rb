# This is to solve the 7th challenge exercise for launch school. It includes my structured
# problem solving approach

=begin

P:

E:

D:

A:

=end

class Octal
  def initialize(octal)
    @octal = scrub(octal)
  end

  def to_decimal
    i = -1
    @octal.to_i.digits.reduce(0) do |sum, num|
      i += 1
      sum + (num * (8**i))
    end
  end

  private

  def scrub(octal)
    octal.match?(/[8-9^\D]/) ? '0' : octal
  end
end
