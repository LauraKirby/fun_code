
# input 4 5 6 7 8 9 0 1 2 3

def find_value(input, specific_value,midpoint)

  if input[midpoint] == specific_value
    puts "index of 'specific_value' is: #{midpoint}"
    return midpoint
  end

  midpoint = input.length/2


  # split array into 2
  left_array = input.slice(0..midpoint - 1)
  puts "left_array: #{left_array}"
  right_array = input.slice(midpoint..input.length - 1)
  puts "right_array: #{right_array}"
  if beginning_lower_than_end?(right_array) && value_exists_within_list?(right_array, specific_value)
    # will return false
    # evaluate right_array
    find_value(right_array, specific_value)
    return midpoint
  elsif !beginning_lower_than_end?(left_array) && value_exists_within_list?(right_array, specific_value)
    # evaluate left_array
    print "left_array[midpoint]: #{left_array[midpoint]}"
    find_value(left_array, specific_value)
    return midpoint
  end


end

def value_exists_within_list?(arr, value)
   return true if value >= arr.first && value <= arr.last
   return true if arr.first > arr.last && value < arr.first && value < arr.last
   return false
end

def beginning_lower_than_end?(arr)
  return true if arr.first > arr.last
end


find_value([1,2,3,4,5], 2)

  # # rotation point exists here
  # if beginning_lower_than_end?(arr) && input.first > specific_value && input.last > specific_value
  #   if input[midpoint] != specific_value
  #     input = input.slice(0..midpoint)
  #     find_value(input, specific_value, midpoint)
  #   else
  #     # midpoint == specific_value
  #     return input[midpoint]
  #   end
  # end