# Consider an object that contains a 10 bit integer, and a string.
# Sort a 10 million array of such objects by the integer
# (don’t care for the string sorting)  where each object is
# (10bit integer and a string) in place using 0(1) extra
# memory and in O(n) time complexity

# 10 bit integer ==> 0-1023
# object.integer
# input   [obj_val_7, obj_val_4, obj_val_2, obj_val_1]
# output  [obj_val_1, obj_val_2, obj_val_4, obj_val_7]

# size complexity: O(n + k)
# n is the input array size
# k represents the value options (0-1023)

# time complexity is the same of size complexity, O(n + k)

input_arr = [1, 4, 1, 2, 7, 5, 2]

def sort_array(input_arr)
  max = 1023
  nums_count_arr = Array.new(max + 1, 0)
  result = Array.new(input_arr.size)

  return false if input_arr.length == 0
  return input_arr if input_arr.length == 1 && input_arr[0] >= 0

  #count the occurance of each value
  input_arr.each do |val|
    return false if val > 1023 || val < 0
    nums_count_arr[val] += 1
  end

  # calculate the position of each object for the result array by
  # store the sum of the previous counts in each element of the nums_count_arr
  nums_count_arr.length.times do |i|
    nums_count_arr[i] = nums_count_arr[i] + nums_count_arr[i - 1]
  end

  # propagate result array with sorted values.
  input_arr.length.times do |i|
    nums_count_arr[input_arr[i]] -= 1
    result[nums_count_arr[input_arr[i]]] = input_arr[i]
  end

  puts result
  return result
end

sort_array(input_arr)
