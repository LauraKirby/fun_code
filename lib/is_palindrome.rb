# Leetcode setup:
# Determine whether an integer is a palindrome. Do this without extra space.

# @param {Integer} x
# @return {Boolean}

def is_palindrome(x)
  str = x.to_s.reverse
  return false if str.length <= 1

  int = str.to_i
  result = false
  if str[-1] == "-"
    int = -int
  end
  result = true if x == int
  return result
end