# This is the solution and my strategic problem solving
# approach for launch schools challenge exercise 3

=begin

P:
-convert modern decimal numbers into roman number equiv
-no need to convert > 3000
-express each digit separately starting with left
-skip any digit with a value of 0

E:
constructor - takes 1 argument, an int

to_roman method
  -returns string of roman numeral

D: int, string, RN class

A:
create RN class
  -create Contstant with translation values
  -constructor with 1 arg, as int. no errors raised
    -set to_roman as instance variable
  -to_roman instance method
    -call once in initialize
    -take int convert to array of nums according to place.
    -transfrom arr, multiply by index and look up constant value
    -reverse order in array and convert to string
=end

class RomanNumeral
  INT_TO_ROMAN = { 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V', 6 => 'VI',
                   7 => 'VII', 8 => 'VIII', 9 => 'IX', 10 => 'X', 20 => 'XX',
                   30 => 'XXX', 40 => 'XL', 50 => 'L', 60 => 'LX', 70 => 'LXX',
                   80 => 'LXXX', 90 => 'XC', 100 => 'C', 200 => 'CC', 300 => 'CCC',
                   400 => 'CD', 500 => 'D', 600 => 'DC', 700 => 'DCC', 800 => 'DCCC',
                   900 => 'CM', 1000 => 'M', 2000 => 'MM', 3000 => 'MMM' }.freeze

  def initialize(int)
    @decimal = int
    @roman = decimal_to_roman
  end

  def to_roman
    @roman
  end

  private

  def decimal_to_roman
    place_values = @decimal.digits
    place_values.map!.with_index do |num, i|
      adj_num = num * (10**i)
      INT_TO_ROMAN[adj_num]
    end
    place_values.reverse.join
  end
end
