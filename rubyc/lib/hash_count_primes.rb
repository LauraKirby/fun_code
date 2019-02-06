def count_primes(input)
  count = 0
  for i in 1..input
    count +=1 if is_prime?(i)
  end
  count
end

def is_prime?(num)
  for i in 2..Math.sqrt(num).ceil
    return false if num % i == 0
  end
end

puts count_primes(10)

