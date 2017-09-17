# fibonacci sequence, starting with "1, 1"
# next number is list[n-1] + list[n-2]

# n is position in the list we want to find the value for
def fibonacci(n)
  return n if (0..1).include? n
  (fibonacci(n - 1) + fibonacci(n - 2))
end

puts fibonacci(12)
# => 144

def fibonacciDynamic(n)
  i = 1
  fib = [1,1]
  while i < (n - 1)
    value = fib[i] + fib[i-1]
    fib[i+1] = value
    i += 1
  end
  puts fib[n-1]
end

fibonacciDynamic(50)
# => 12586269025
