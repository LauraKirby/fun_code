require 'pry'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  result = []
  sum = 0

  puts "target: #{target}  \n\n"
  nums.each_with_index do | num, index_1 |

    nums.each_with_index do | num_2, index_2 |
      if index_2 != index_1
        puts "num: #{num}, num_2: #{num_2}"

        puts "result = [index_1: #{index_1}, index_2: #{index_2}]"
        result = [index_1, index_2]


        puts "add: #{nums[index_1]} + #{nums[index_2]}"
        sum = nums[index_1] + nums[index_2]

        return result if sum == target
      end
    end
  end
end

# sum_result = two_sum([2,3,4,5], 6)
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

