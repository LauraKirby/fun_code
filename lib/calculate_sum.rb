require 'pry'
require_relative '../lib/constants.rb'
include Constants
# did_break = "unknown"
# puts "num > target" if num > target
# break if num > target


# param {Integer[]} nums
# param {Integer} target
# return {Integer[]}
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# notes
# target = 7
# current index = 0
# [2,3,4,7][0] = 2
# target - 2 = 5
# complement = 5
# hash = {nums[index]: index}

def two_sum(nums, target)
  puts "target: #{target}"
  @hash_map_sum = {}

  nums.each_with_index do | num, index |
    complement = target - nums[index]
    if @hash_map_sum.key?(complement)
      puts "complement #{complement}"
      # return values in array format if correct total
      puts "#{@hash_map_sum[complement]}, #{index}"
      result = [@hash_map_sum[complement], index]
      puts "results: [#{result[0]}, #{result[1]}]"
      sum = LARGE_ARRAY[result[0]] + LARGE_ARRAY[index]
      puts "sum: #{sum}"
      puts "target: #{target}"
      return result
    end
    @hash_map_sum[nums[index]] = index
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

