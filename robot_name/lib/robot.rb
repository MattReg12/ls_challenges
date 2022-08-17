# This is to solve the launch school medium challenges #2. It includes
# my structured solving problem approach.

=begin

p: write a program that manages robot factory settings
- when created they have no name,
- when you first boot them up, a random name is generated
- random name consists of 2 letters and 3 numbers
- need a function to wipe the setting and next time you ask,
  it gens a new name
- names should not follow a predictable sequence

e:
-letters are capitalized
- no args in constructor
- name method creates and sets variable. does not reset if available
- reset method wipes @name instance variable

d:

a:
- create alphabet constant in main
- Robot class
  -no constructor
  -name method
    returns name if available
    sets name as random if not
      -Sample A-Z twice + rand 100-999 digit
  -reset method - sets name to nil

=end

ALPHABET = ('A'..'Z').to_a

class Robot
  @@used_names = [nil]

  def name
    @name ||= random_name
  end

  def reset
    @@used_names.delete(@name)
    @name = nil
  end

  private

  def random_name
    name = nil
    until !@@used_names.include?(name)
      name = ''
      2.times { name << ALPHABET.sample }
      name << rand(100..999).to_s
    end
    @@used_names << name
    name
  end
end

