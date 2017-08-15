# Implement atoi to convert a string to an integer.

# Hint: Carefully consider all possible input cases.

# @param {String} str
# @return {Integer}

# ASCII value: 48 - 57 are numbers when converted to string

# Brainstorm:
# Edge cases:
  # if the argument or the result:
    # length is less than 1
    # is nil
    # is a type other than Integer or String is passed into the method
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
  return 0 if str == nil || str == ""

  if str.class == Integer
    return 0 if str > 2147483647 || str < -2147483648
    return str

  elsif str.class == String
    str_arr = str.split("")

    str_arr.each_with_index do  |v, i|
      ascii_value = v.ord
      if ascii_value >= 48 && ascii_value <= 57
        result.push(v)
      end
    end

    return 0 if result.length == 0

  else
    return 0
  end

  result = result.join.to_i
  result = -result if str[0] == "-"

  return 0 if result > 2147483647 || result < -2147483648

  return result
end

