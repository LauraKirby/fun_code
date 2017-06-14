def isUnique(str)
  hash_map = {}
  str.each_char do |c|
    if hash_map[c] && hash_map[c] > 0
      hash_map[c] += 1
    else
      hash_map[c] = 1
    end
  end
  result = hash_map.has_value?(2)
  puts result ? "false" : "true"
end

isUnique("hi")
puts "hi - should be true"
isUnique("hello")
puts "hello - should be false"

isUnique("helol")
puts "helol - should be false"

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
