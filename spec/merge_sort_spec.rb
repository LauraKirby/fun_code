require '_spec_helper'

describe "#merge_sort" do
  it "returns sorted array" do
    expect(merge_sort([5,9,1,11])).to match_array([1,5,9,11])
  end
  # it "returns 'false' if the input's length is equal to or shorter than one" do
  #   expect(merge_sort([5,9,1,11,7])).to match_array([1,5,7,9,11])
  # end
end

# basic cases
  # it should sort an array with length 2
    # expect merge_sort([2,1]) to match [1,2]
  #

# Edge cases
  # An already sorted list
  # A reverse sorted list
  # A list consisting of the same element throughout
  # A list containing dupes

# Error cases
  # it should only accept type Array
    # expect merge_sort("") eq "invlaid list"
  # it should only accept Arrays between 'n' and 'x' in size
    # expect merge_sort([]) eq "invlaid list"
    # expect merge_sort([x].length > max) eq "invlaid list"




