# an embeded loop  where each loop iterates over a different array
# runtime o(ab)

# input: [1,2], [8,9]
# output: (1,8), (1,9), (2,8), (2,9)

def print_unordered_pairs(arr_1, arr_2)
  for i in 0..arr_1.length - 1 do
    for j in 0..arr_2.length - 1 do
      puts "#{arr_1[i]}, #{arr_2[j]}"
    end
  end
end

# a_1 = [1,4,7,9]
# a_2 = [3,6,8,10]
# print_unordered_pairs(a_1, a_2)


