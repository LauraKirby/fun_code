# closure is a method remembers its context when it is called/created

# one way to create a closure is by using a Proc object

def power(exponent)
end

arr = [1,2,3]



my_proc = Proc.new { |arg| puts "#{arg}! " }

arr.each(&my_proc)


my_proc.call("hi")