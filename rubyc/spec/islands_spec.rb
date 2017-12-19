require '_spec_helper'

describe "#count_islands" do
  before(:each) do
    input = [
              [0,0,0,1],
              [0,0,1,0],
              [0,1,0,0],
              [0,1,1,0]
            ]
    @island_map = IslandMap.new(input)
  end

  # it "changes '1' to true" do
  #   output = [
  #             [0,0,0,true],
  #             [0,0,true,0],
  #             [0,true,0,0]
  #           ]
  #   result = @island_map.count_islands
  #   expect(result).to match output
  # end

  it "returns count of islands to true" do
    result = @island_map.count_islands
    expect(result).to eq 3
  end
end

# describe "#has_neighbor?" do
#   before(:each) do
#     input = [
#               [0,0,1,0],
#               [0,0,1,0],
#               [1,1,0,0]
#             ]
#     @island_map = IslandMap.new(input)
#   end


#   it "returns true when a one is located north of the input position" do
#     result = @island_map.matrix.has_neighbor?(1, 2)
#     # result = @island_map.send(:has_neighbor?, 1, 0)
#     expect(result).to eq true
#   end

#   it "returns true when a one is located south of the input position" do
#     result = @island_map.send(:has_neighbor?, 0, 2)

#     expect(result).to eq true
#   end

#   it "returns true when a one is located east of the input position" do
#     result = @island_map.send(:has_neighbor?, 2, 0)

#     expect(result).to eq true
#   end

#   it "returns true when a one is located west of the input position" do
#     @island_map.matrix = [[1,0], [1,0]]

#     result = @island_map.send(:has_neighbor?, 2, 1)
#     expect(result).to eq true
#   end

# end