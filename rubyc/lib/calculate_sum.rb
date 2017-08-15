# Leetcode setup
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# param {Integer[]} nums
# param {Integer} target
# return {Integer[]}

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