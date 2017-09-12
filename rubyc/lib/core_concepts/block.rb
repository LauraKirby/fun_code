
# Ruby's blocks are closure-like structures
# Pro's reduce repetition and even make coding less error-prone

# A block is basically a chunk of code that you associate with a
# method call. While the method runs, it can invoke the block one
# or more times.

# A block is a piece of syntax and not an object

3.times do
  puts "hello"
end


3.times {
  puts "hello"
}

# convention: {} for one line, 'do' 'and' for multi-line

# returning something from a block,
# 'return' keyword won't work
# use the 'implicit' return.
# meaning, the last line of block

# block is an argument to the method

# a way to execute a group of statements
# {
#   execute these statements
# }

# define a method that will take a block
def greet
  print "Hello "
  # leave method definition and execute code that was
  # passed in within the block argument (print " my friend")
  yield
  # return from executing external block
  print "Have a nice day!"
end


# call method and pass it a block
# greet do
#   print "my friend. "
# end

# BLOCK ARGUMENTS
# send argument to block
def get_name
  print "what is your name?"
  user_name = gets.chomp
  # pass in name argument
  yield user_name
  # return name so that when storing the result
  # of this method call, the name will be stored
  user_name
end

# my_name = get_name do |n|
#   puts "thats a cool name, #{n}"
# end

# puts "my name: #{my_name}"

# CALLING BLOCKS
def get_name(prompt, &block)
  print prompt + ": "
  user_name = gets.chomp
  # can use the variable name (method arguments)
  # you could still use 'yield'
  block.call(user_name)
  user_name
end

# block method: block_given?
# only execute the block if one was given
def get_name(prompt, &block)
  print prompt + ": "
  user_name = gets.chomp
  block.call(user_name) if block_given?
  user_name
end

# block methods
# original array is not modified
arr = [1,2,3,4,5]
puts "original arr: #{arr}"
result = arr.map do |i|
  i += 6
end
puts "result map: #{result}"
# => result map: [7, 8, 9, 10, 11]

puts "original arr: #{arr}"
result = arr.select do |i|
  i > 4
end
puts "result select: #{result}"
# => result select: [5]

puts "original arr: #{arr}"
result = arr.each do |i|
  i += 6
end
puts "result each: #{result}"
# => result each: [1, 2, 3, 4, 5]

# return total for items that return true
puts "original arr: #{arr}"
result = arr.count do |i|
  i % 3 == 0
end
puts "result count: #{result}"
# => result each: 1


# BLOCKS FOR HASSES
h = {name: "laura", profession: "software engineer"}
h.each do |k,v|
  puts "key: #{k}, value: #{v}"
end

# additional methods, hash.each_key, hash.each_value
# keep_if? - remove items that do not meet condition
# destructive of original hash
h.keep_if do |k,v|
  k == :name
end

puts h
# => {name: "laura"}

# hash.reject - returns new has with items removed,
# does not destroy original hash