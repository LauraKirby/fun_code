require '_spec_helper'

describe "#sort_array" do
  it "returns false if array count equals 0" do
    expect(sort_array([])).to match(false)
  end

  it "returns a single element array" do
    container = Container.new(2, "redis")
    expect(sort_array([container])).to match_array([container])
  end

  it "returns an array of ordered array elements based on the integer value of the object's number property" do
    container_1 = Container.new(1, "redis")
    container_2 = Container.new(5, "redis")
    container_3 = Container.new(10, "redis")
    input = [container_3, container_2, container_1]
    output = [container_1, container_2, container_3]
    expect(sort_array(input)).to match_array(output)
  end

  it "will return false if it encounters a number larger than a 10 bit integer (ie 1023)" do
    container = Container.new(1000000333, "redis")
    expect(sort_array([container])).to match(false)
  end

  it "will return false if it encounters a number less than 0" do
    container = Container.new(-1, "redis")
    expect(sort_array([container])).to match(false)
  end
end
