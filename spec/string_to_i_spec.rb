require '_spec_helper'

describe "#string_to_i" do
  it "recieves an integer and returns that integer" do
    expect(my_atoi(12)).to eq 12
  end

  it "recieves a space character and returns 0" do
    expect(my_atoi(" ")).to eq 0
  end

  # String with one int value:
  # "1"
  # => 1

  # String with one int value followed by a char:
  # "1a"
  # => 1

  # String that begins with a char and ends with an int
  # "a1"
  # => 1

  # String that has a char and a space before the int
  # "a 1"
  # => 1

  # String that has a symbol before the int
  # "%1"
  # => 1

  # String that has 2 integers in a row
  # "12"
  # => 12

  # String that has 2 integers with chars on either side
  # "a1b2c"
  # "12"
end