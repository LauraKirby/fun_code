require 'pry'
require './lib/constants.rb'
include Constants

# param {Integer[]} nums
# param {Integer} target
# return {Integer[]}
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.

def two_sum(nums, target)
  hash_map_sum = {}

  nums.each_with_index do | num, index |
    complement = target - nums[index]
    if hash_map_sum.key?(complement)
      result = [hash_map_sum[complement], index]
      return result
    end
    hash_map_sum[nums[index]] = index
  end
  puts "no two sum solution"
end

two_sum(LARGE_ARRAY, LARGE_SUM)

# param {Integer} x
# return {Integer}
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


# param {Integer} x
# return {Boolean}
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

