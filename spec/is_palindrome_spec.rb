require '_spec_helper'

describe "#is_palindrome(x)" do
  it "returns 'true' if the number reads the same forward and backward" do
    expect(is_palindrome(212)).to be true
  end

  it "returns 'false' if the number does not read the same forward and backward" do
    expect(is_palindrome(211)).to be false
  end
end