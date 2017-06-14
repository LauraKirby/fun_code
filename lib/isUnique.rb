def isUnique(str)
  hash_map = {}
  result = true
  str.each_char do |c|
    if hash_map[c] && hash_map[c] > 0
      result = false
      hash_map[c] += 1
      result = false
      puts "result: #{result}"
      return
    else
      hash_map[c] = 1
    end
  end
  puts "result: #{result}"
end

puts "hi - should be true"
isUnique("hi")
puts "\n\n"

puts "hello - should be false"
isUnique("hello")
puts "\n\n"

puts "helol - should be false"
isUnique("helol")
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

# optimization:
# return false as soon as we set a key's value to "2"
