# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  s = x.to_s.reverse
  i = s.to_i
  result = false
  if s[0] == "-"
    i = -i
  end
  result = true if x == i
  return result
end