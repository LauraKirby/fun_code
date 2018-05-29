require '_spec_helper'

describe "create a map" do
  it "returns matrix [['1a', '1b'],['2a', '2b']]" do
    input = "1a 1b 2a 2b"
    my_map = Map.new(input)
    expect(my_map.maxtrix).to match_array([['1a', '1b'],['2a', '2b']])
  end
end

