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

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)

end