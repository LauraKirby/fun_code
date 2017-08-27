# remove duplicates without extra space
# ruby, can do this with 'uniq' method
# time complexity of Array#uniq O(n)

# o(n) means no extra space

# in-place means that the algorithm does not use extra space for manipulating
# the input but may require a small though non-constant extra space for its
# operation. Usually, this space is O(log n), though sometimes anything in
# o(n) is allowed.

# Quicksort
# Runtime - Average: O(n * lg(n)), worst case: O(n**2)
# Memory - O(log n)

# test cases:
#   empty array
#   non-numbers
#   returns sorted array
#   can handle negative numbers and floats?
#   removes duplicates
#   if all numbers are duplicates,

# small talk functional programming language, may have a good answer for this
# no key words, look at enumerable methods

def quick_sort (arr, left, right)
  arr_index = partition(arr, left, right)
  if left < arr_index - 1 # sort left half
    quick_sort(arr, left, arr_index - 1)
  end

  if arr_index < right # sort right half
    quick_sort(arr, arr_index, right)
  end

  # if left < arr_index && arr_index < right
  #   puts "arr: #{arr}"
  #   arr
  # end

end

def partition(arr, left, right)
  i = (left + right) / 2 # # pick pivot point
  pivot = arr[i] # value at pivot point
  puts "left: #{left}, right: #{right}"
  puts "pivot: #{pivot}"
  while left <= right
    # find element on left that should be on right
    while arr[left] < pivot
      puts "left: #{left}"
      left += 1
    end

    while arr[right] > pivot
      puts "right: #{right}"
      right -= 1
    end

    if left <= right
      puts "prev - left: #{arr[left]}, right: #{arr[right]}"
      temp = arr[left]
      arr[left] = arr[right]
      arr[right] = temp
      puts "new - left: #{arr[left]}, right: #{arr[right]}"
      left += 1
      right -= 1
    end
  end

  puts "return left: #{left}"
  left
end

arr = [10,3,4,8,4,11,13]
quick_sort(arr, 0, arr.length - 1)

# find element on left that should be on right
# left += 1 while arr[left] < pivot

# find element on left that should be on right
# right -= 1 while arr[right] > pivot
