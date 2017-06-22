require 'pry'
# Implement atoi to convert a string to an integer.

# Hint: Carefully consider all possible input cases.

# @param {String} str
# @return {Integer}

# ASCII value: 48 - 57 are numbers when converted to string

# Brainstorm:
# Edge cases:
  # if the argument:
  # is type Integer, return that Integer
  # length is less than 1 or nil, return 0
  # is greater or less than bounds (eg string > 2147483647 || string < -2147483648)

# Two approaches
  # Implementing this version:
  # 1. use an array
  # turn string into array
  # iterate over each array item
    # if the ASCII value of the item is between 48 - 57
      # convert ASCII value to integer string number
      # join string number onto result
  # return

  # Doesn't make sense to create hash,
  # since we can conquer coverting on initial iteration of string
  # 2. use a hash
  # the key is the index and the value is that ASCII value
    # if the hash value is between 48 - 57
      # convert ASCII value to integer string number
      # join string number onto result
  # return result

# Tests:
  # See string_to_i.rb

def my_atoi(str=nil)
  result = []

  if str.class == Integer
    return str

  elsif str.class == String
    str_arr = str.split("")

    str_arr.each_with_index do  |v, i|
      ascii_value = v.ord
      if ascii_value > 48 || ascii_value < 57
        # add if it is within this range
        result.push(v)
      end
    end

  end

  return 0 if result.length == 0
  return result.join.to_i
end



