# require '_spec_helper'

# describe "#find_median_sorted_arrays" do
#   it "recieves two empty arrays. returns zero" do
#     expect(find_median_sorted_arrays([],[])).to eq 0
#   end

#   it "recieves an array with a length 1 and an empty array" do
#     expect(find_median_sorted_arrays([12],[])).to eq 12
#   end

#   it "recieves an array with a length 1 and an empty array" do
#     expect(find_median_sorted_arrays([],[12])).to eq 12
#   end

#   it "recieves an array with a length of 2 and an empty array" do
#     expect(find_median_sorted_arrays([],[2,3])).to eq 2.5
#   end

#   it "recieves an array with a length of 2 and an empty array" do
#     expect(find_median_sorted_arrays([2,3],[])).to eq 2.5
#   end

#   it "recieves an array with a length of 2 and an empty array" do
#     expect(find_median_sorted_arrays([],[2,3,5])).to eq 3
#   end

#   it "recieves two arrays with the length of one each" do
#     expect(find_median_sorted_arrays([6],[4])).to eq 5
#   end

#   it "recieves two arrays with the length of one each, where result is a float" do
#     expect(find_median_sorted_arrays([6],[5])).to eq 5.5
#   end

#   it "recieves two arrays with the length of one and the length of two" do
#     expect(find_median_sorted_arrays([6,7],[4])).to eq 6
#   end

#   it "recieves two arrays with the length of two (total length of array is even)" do
#     expect(find_median_sorted_arrays([6,7],[4,9])).to eq 6.5
#   end

#   it "recieves two arrays with the length of three (total length of array is odd)" do
#     expect(find_median_sorted_arrays([11,12,13],[1,2,9])).to eq 10
#   end

#   it "can handle negative numbers" do
#     expect(find_median_sorted_arrays([-13, -12, -11],[1,2,9])).to eq -5
#   end

#   it "can handle floats" do
#     expect(find_median_sorted_arrays([-13.5, -12.5, -11.5],[1,2,9])).to eq -5.25
#   end
# end