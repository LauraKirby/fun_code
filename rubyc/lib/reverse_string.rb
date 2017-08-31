def reverse_string(str)
  return false if str.class != String
  reversed_str = ""
  i = 0
  while i < str.length
    puts "str[i] + reversed_str: #{str[i]} + #{reversed_str}"
    reversed_str = str[i] + reversed_str
    i += 1
  end
  reversed_str
end

def reverse_recursive(str)
  # stop recursion, once we reach string leng
  return str if str.length <= 1
  revsersed_str = reverse_recursive(str[1..-1])
  revsersed_str += str[0]
  revsersed_str
end

str = "string"
# reverse_string(str)
reverse_recursive(str)
