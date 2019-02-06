

arr2 = ['a','b','c','d']

def binary(a2, n, i)
  # arr = ['a','b','c','d']
  if (n < 1)
    puts "\nnew combo a2: #{a2}\n\n"
  else
    a2[n - 1] = 0
    puts "a2[n - 1] = 0 : a2[#{n} - 1] = 0}\n"
    binary(a2, n - 1, i += 1)
    a2[n - 1] = 1
    puts "a2[n - 1] = 1 : a2[#{n} - 1] = 1}\n"
    binary(a2, n - 1, i += 1)

  end
end


binary(arr2, arr2.length, 0)