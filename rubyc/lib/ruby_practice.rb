# Write a function that sorts the keys in a hash by the
# length of the key as a string. For instance, the hash:

hsh = { abc: 'hello', 'another_key' => 123, 4567 => 'third' }

# &: is shorthand for to_proc
hsh.keys.map(&:to_s).sort_by(&:length)

# => ["abc", "4567", "another_key"]


# ----------------------------------

# the “stabby proc”.
# ->
# also called the “stabby lambda”,
# as it creates a new Proc instance that is a lambda.
# All lambdas are Procs, but not all Procs are lambdas.

-> (a) {p a}["Hello world"]

# => "Hello world"

# This particular Proc takes one parameter (namely, `a`).
# When the Proc is called, Ruby executes the block p a, which is the equivalent of puts(a.inspect) (a subtle, but useful, difference which is why p is sometimes better than puts for debugging). So this Proc simply prints out the string that is passed to it.

# You can call a Proc by using either the call method on Proc, or by using the square bracket syntax, so this line of code also invokes the Proc and passes it the string “Hello World”.

# So putting that all together, this line of code (a) creates a Proc that takes a single parameter a which it prints out and (b) invokes that Proc and passes it the string “Hello world”. So, in short, this line of code prints “Hello World”.

# ----------------------------------

# given
x = "hello"

# explain the difference between '+=' and 'concat':

# creates a new object and points the the old variable
# to the new object.
x += " world"
puts "+= #{x}"

x = "hello"
x.concat " world"
puts ".concat #{x}"

