# Leetcode setup:
# Determine whether an integer is a palindrome. Do this without extra space.

# @param {Integer} x
# @return {Boolean}

def is_palindrome(x)
  return false if x > 2147483647 || x < -2147483648
  result = false
  str = x.to_s.reverse
  int = str.to_i

  return true if str.length <= 1
  return false if str[-1] == "-"

  result = true if x == int

  return result
end