# a class
# with a method called "method"
# convenient way to pass a normal method to another normal method
# 1. call a method that takes an argument
# 2. pass in a second method and wrap it in
#    a. method()
#    b. add ":" to symbolize name of second method
#    c. `my_first_method(method(:second_method))`

def my_first_method(arg)
  arg.call
end

def second_method
  print "hello Method class"
end

my_first_method(method(:second_method))

# does first method require that a block is passed in?

# second_method