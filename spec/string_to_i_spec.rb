require '_spec_helper'

describe "#string_to_i" do
  it "recieves an integer and returns that integer" do
    expect(my_atoi(12)).to eq 12
  end

  it "recieves a space character and returns 0" do
    expect(my_atoi(" ")).to eq 0
  end

  it "recieves a string with '1' and returns the integer value 1" do
    expect(my_atoi("1")).to eq 1
  end

  it "recieves a string with '1a' and removes the 'char' and returns the integer value 1" do
    expect(my_atoi("1a")).to eq 1
  end

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

  # to do, write tests for edge cases
end