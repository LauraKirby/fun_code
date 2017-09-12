def is_unique(str)
  hash_map = {}
  result = true
  str.each_char do |c|
    if hash_map[c] && hash_map[c] > 0
      result = false
      hash_map[c] += 1
      result = false
      puts "result one: #{result}"
      return
    else
      hash_map[c] = 1
    end
  end
  puts "result end: #{result}"
end

puts "hi - should be true"
is_unique("hi")
puts "\n\n"

puts "hello - should be false"
is_unique("hello")
puts "\n\n"

puts "helol - should be false"
is_unique("helol")
puts "\n\n"

# test cases:
# hi
# hello
# helol
# llheo

# would want to clarify with interviewer:
# is an empty string unique?
# isUnique("")

# an optimization might be to check if string length is 1,
# then return true

# time complexity: O(N)
  # where n is the length of the string
# space complexity: o(1)
  # will never need a hash larger than 128 characters, because
  # this is the number of available characters


# reduce space by using a bit vector, i don't know this concept.
# should come back to this

def is_unique_arr(arr)
  hash_map = {}
  result = true
  arr.each do |c|
    if hash_map[c] && hash_map[c] > 0
      result = false
      hash_map[c] += 1
      result = false
      puts "result one: #{result}"
      return
    else
      hash_map[c] = 1
    end
  end
  puts "result end: #{result}"
end

arr = [1,3,4,5,6]
is_unique_arr(arr)
