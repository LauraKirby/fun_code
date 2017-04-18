require 'pry'
require './constants'
include Constants




# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.


# public int[] twoSum(int[] nums, int target) {
#     Map<Integer, Integer> map = new HashMap<>();
#     for (int i = 0; i < nums.length; i++) {
#         int complement = target - nums[i];
#         if (map.containsKey(complement)) {
#             # return value if it is correct
#             return new int[] { map.get(complement), i };
#         }
#         # add values to hash
#         map.put(nums[i], i);
#     }
#     throw new IllegalArgumentException("No two sum solution");
# }


def two_sum(nums, target)
  hash_map = {}



  sorted_nums.each_with_index do | num, index |
    puts "num > target" if num > target
    break if num > target
    hash_map[index] = num
  end


  sorted_nums.each_with_index do | num_2, index_2 |
    if index_2 != index_1
      result = [index_1, index_2]
      sum = nums[index_1] + nums[index_2]

      return result if sum == target
    end
  end

end


# sum_result = two_sum(ARRAY_INPUT, TARGET_SUM)
# puts sum_result

# @param {Integer} x
# @return {Integer}
def reverse(x)
    s = x.to_s
    r = s.reverse
    i = r.to_i
    if s[0] == "-"
      i = -i
    end
    puts i
    return 0 if i > 2147483647 || i < -2147483648
    i
end


# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  s = x.to_s.reverse
  i = s.to_i
  result = false
  if s[0] == "-"
    i = -i
  end
  result = true if x == i
  return result
end

