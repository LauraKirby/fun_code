require '_spec_helper'

describe "#sort_array" do
  it "returns false if array count equals 0" do
    expect(sort_array([])).to match(false)
  end

  it "returns a single element array" do
    expect(sort_array([2])).to match_array([2])
  end

  it "returns an array of ordered array elements based on the integer value of the object's number property" do
    expect(sort_array([1, 4, 1, 2, 7, 5, 2])).to match_array([1, 1, 2, 2, 4, 5, 7])
  end

  it "will return false if it encounters a number larger than a 10 bit integer (ie 1023)" do
    expect(sort_array([1025, 1000000333])).to match(false)
  end

  it "will return false if it encounters a number less than 0" do
    expect(sort_array([-1])).to match(false)
  end
end
