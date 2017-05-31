# @param {Integer} x
# @return {Integer}
def reverse(x)
    s = x.to_s
    r = s.reverse
    i = r.to_i
    if s[0] == "-"
      i = -i
    end
    puts i
    return 0 if i > 2147483647 || i < -2147483648
    i
end