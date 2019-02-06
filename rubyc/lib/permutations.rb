# Given a collection of distinct integers, return all possible permutations.

# Example:

# Input: [1,2,3]
# Output:
# [
#   [1,2,3],
#   [1,3,2],
#   [2,1,3],
#   [2,3,1],
#   [3,1,2],
#   [3,2,1]
# ]



# arr2 = ['a','b','c','d']

# def binary(a2, n, i)
#   # arr = ['a','b','c','d']
#   if (n < 1)
#     puts "\nnew combo a2: #{a2}\n\n"
#   else
#     a2[n - 1] = 0
#     puts "a2[n - 1] = 0 : a2[#{n} - 1] = 0}\n"
#     binary(a2, n - 1, i += 1)
#     a2[n - 1] = 1
#     puts "a2[n - 1] = 1 : a2[#{n} - 1] = 1}\n"
#     binary(a2, n - 1, i += 1)

#   end
# end


# binary(arr2, arr2.length, 0)


# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  result = find_permutations(nums, 0, (nums.length - 1), [])
  print result
end

def find_permutations(nums, start_index, end_index, result)
  result ||= []
  if start_index == end_index
    result.push(nums)
  else
    for i in start_index..end_index do
      nums[start_index], nums[i] = nums[i], nums[start_index]
      find_permutations(nums, (start_index + 1), end_index, result)
      nums[start_index], nums[i] = nums[i], nums[start_index]
      i += 1
    end
  end
  result
end


input = [1,2,3]
permute(input)