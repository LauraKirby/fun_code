require '_spec_helper'

describe "#reverse_integer" do
  it "accepts an integer with the length of one and returns that integer" do
    expect(reverse_integer(1)).to eq(1)
  end

  it "accepts a string with the length of two and returns the reverse of that integer" do
    expect(reverse_integer(12)).to match(21)
  end

  it "returns 0 if input integer exceeds the highest 32-bit signed integer" do
    expect(reverse_integer(12147483648)).to eq(0)
  end

  it "returns 0 if input integer exceeds the lowest 32-bit signed integer" do
    expect(reverse_integer(-2147483649)).to eq(0)
  end
end