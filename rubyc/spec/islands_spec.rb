require '_spec_helper'

describe "#count_islands" do

  it "returns count of islands to true" do
    input = [
              [0,0,0,1],
              [0,0,1,0],
              [0,1,0,0],
              [0,1,1,0]
            ]
    result = count_islands(input)
    expect(result).to eq 3
  end
end
