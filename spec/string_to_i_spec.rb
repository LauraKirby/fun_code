require '_spec_helper'

describe "#string_to_i" do
  it "recieves an integer and returns that integer" do
    expect(my_atoi(12)).to eq 12
  end

  it "recieves a space character. it returns 0" do
    expect(my_atoi(" ")).to eq 0
  end

  it "recieves a string with a number. it returns the integer value" do
    expect(my_atoi("1")).to eq 1
  end

  it "recieves a string with a number and a char. it returns an integer for the number" do
    expect(my_atoi("1a")).to eq 1
  end

  it "recieves a string that begins with a char and ends with a number. it returns an integer for the number" do
    expect(my_atoi("1a")).to eq 1
  end

  it "recieves a string that begins with a number and ends with a char. it returns an integer for the number" do
    expect(my_atoi("a1")).to eq 1
  end

  it "recieves a string that begins with a char, followed by a symbol and ends with a integer. it returns an integer for the number" do
    expect(my_atoi("a 1")).to eq 1
  end

  it "recieves a string that has two numbers in a row. it returns a concatenated integer for the numbers" do
    expect(my_atoi("1232341345")).to eq 1232341345
  end

  it "recieves a string that has two numbers with a char on either side. it returns a concatenated integer for the numbers" do
    expect(my_atoi("a-1b2c")).to eq 12
  end

  it "recieves a string that has a length of 0. it returns 0." do
    expect(my_atoi("")).to eq 0
  end

  it "recieves a nil value. it returns 0" do
    expect(my_atoi(nil)).to eq 0
  end

  it "recieves a number that is beyond the upper bound. it returns 0" do
    expect(my_atoi(2147483648)).to eq 0
  end

  it "recieves a String with a number that is beyond the upper bound. it returns 0" do
    expect(my_atoi("aaaa21bbbbb4748cccc3648ffffff")).to eq 0
  end

  it "recieves a string that starts with '-'. it returns a negative number." do
    expect(my_atoi("-a1b2c")).to eq(-12)
  end

  it "recieves a number that is beyond the lower bound. it returns 0" do
    expect(my_atoi(-2147483649)).to eq 0
  end

  it "recieves a number that is beyond the lower bound. it returns 0" do
    expect(my_atoi("-asdf2147daf483dasdfrag649")).to eq 0
  end
end