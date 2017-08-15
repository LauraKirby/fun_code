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
  combined_arr = merge(nums1, nums2)

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

def merge(arr_1, arr_2)
  merged_arr = []
  until (arr_1.empty? || arr_2.empty?) do
    if arr_1.first <= arr_2.first
      merged_arr.push(arr_1.shift)
    else
      merged_arr.push(arr_2.shift)
    end
  end

  merged_arr.concat(arr_1).concat(arr_2)
end