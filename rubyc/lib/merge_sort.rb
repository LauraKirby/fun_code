def merge_sort(arr)
  helper = Array.new(arr.length)
  sort_arr(arr, helper, 0, arr.length - 1)
end

def sort_arr(arr, helper, low, high)

  if low < high
    middle = (low + high) / 2
    sort_arr(arr, helper, low, middle) # sort left half
    sort_arr(arr, helper, middle + 1, high) # sort right half
    merge(arr, helper, low, middle, high) # merge them
  end

end

def merge(arr, helper, middle, low, high)
  # copy both halves into a helper array

  for i in low..high do
    helper[i] = arr[i]
  end

  helper_left = low
  helper_right = middle + 1
  current = low

  # iterate through helper array
  # compare the left and right half, copying back the smaller
  # element from the two halves into the original array

  while helper_left <= middle && helper_right <= high do
    if helper[helper_left] <= helper[helper_right]
      arr[current] = helper[helper_left]
      helper_left += 1
    else # if right element is smaller than left element
      arr[current] = helper_right
      helper_right += 1
    end
    current += 1
  end

  # copy the rest of the left side of the array into the
  # target array

  for i in helper_left..middle do
    arr[current + i] = helper[helper_left + i]
  end

  return arr
end

test_arr = [5,9,11,7]
merge_sort(test_arr)