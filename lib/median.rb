# Find the median of two sorted arrays
# Median: [1,2,3] = 2
# Median: [1,2,3,4]
#         (2 + 3)/2 = 2.5

# 1. Determine if combined input is even or odd in length
  # combined length = length of input_arr_1 + length of input_arr_2.length

# 2. If combined length is even
  # A. Combine arrays
  # Calculate index of median (rounded down) and median(rounded down) + 1.
  # Return median.

# 3. If combined length is odd
  # A. Combine arrays
  # Calculate index of median.
  # Return median.

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1=[], nums2=[])
  return 0 if nums1.empty? && nums2.empty?
  return nums1[0] if nums1.length == 1 && nums2.length < 1
  return nums2[0] if nums2.length == 1 && nums1.length < 1
  return (nums1[0].to_f + nums2[0].to_f)/2 if nums1.length == 1 && nums2.length == 1

  median = 0
  total_length = nums1.length + nums2.length
  arr_index = total_length - 1
  combined_arr = []

  # combine arrays
  until (nums1.empty? || nums2.empty?) do
    if nums1.first <= nums2.first
      combined_arr.push(nums1.shift)
    else
      combined_arr.push(nums2.shift)
    end
  end

  # concat any remaining values
  combined_arr.concat(nums1).concat(nums2)

  if total_length%2 == 0
    median_index_1 = arr_index/2
    median_index_2 = (arr_index/2) + 1
    median = (combined_arr[median_index_1].to_f + combined_arr[median_index_2].to_f)/2
  else
    median_index_1 = arr_index/2
    median = combined_arr[median_index_1].to_f
  end


  return median

end

# puts "median: #{median}"
# 1,3,5,6,7,9
# numsA = [3,6,9]
# numsB = [1,5,7]
# find_median_sorted_arrays(numsA, numsB)