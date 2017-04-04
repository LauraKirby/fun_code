require 'pry'
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# def two_sum(nums, target)
#   nums = [2,3,2,8,5]
#   result = []
#   target = 4
#   sum = 0

#   nums.each_with_index do | num, index_1 |
#     result = [index_1]
#     puts result[0]
#     return result if num + num_2 == target
#     nums.each_with_index do | num_2, index_2 |
#       i_2 = index_2 + 1
#       result.push(index_2)
#       puts "add #{nums[i]} + #{nums[index_2]}"
#       return result if num + num_2 == target
#     end

#     puts result[0]
#     return result
#   end


#     # i = 1
#     # nums.each do |num|

#     # end
# end


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
