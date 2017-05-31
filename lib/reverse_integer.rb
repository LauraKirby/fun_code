# Leetcode setup
# The input is assumed to be a 32-bit signed integer.
# Your function should return 0 when the reversed integer overflows.
# @param {Integer} x
# @return {Integer}

def reverse_integer(x)
    input_string = x.to_s
    return x if input_string.length == 1

    input_string_reversed = input_string.reverse
    input_integer_reversed = input_string_reversed.to_i

    return 0 if input_integer_reversed > 2147483647 || input_integer_reversed < -2147483648

    if input_string[0] == "-"
      input_integer_reversed = -input_integer_reversed
    end

    return input_integer_reversed
end