require 'spec_helper'

  describe "#two_sum" do

      it "returns the index for the values that add up to the given sum" do
        expect(two_sum([2,2],4)).to match_array([0,1])
      end

      it "returns the index for the given sum" do
        expect(two_sum([2,3,2],4)).to match_array([0,2])
      end
  end

describe "#is_palindrome(x)" do
  it "returns 'true' if the number reads the same forward and backward" do
    expect(is_palindrome(212)).to be true
  end

  it "returns 'false' if the number does not read the same forward and backward" do
    expect(is_palindrome(211)).to be false
  end
end