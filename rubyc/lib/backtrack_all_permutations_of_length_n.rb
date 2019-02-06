@a = ['a','b','c','d','e']
@b = ['a','b','c','d','e']

def find_all_permutations(arr_length, new_combination_length)
  # process all strings of length 'arr_length'

  if(arr_length < 1)
    puts "@a: #{@a}"
    puts "temp_string: #{@b[@a[0]]}, #{@b[@a[1]]}, #{@b[@a[2]]}, #{@b[@a[3]]}"
  else
    for j in 0..new_combination_length - 1  do
      @a[arr_length - 1] = j
      find_all_permutations(arr_length - 1, new_combination_length)
      j += 1
    end
  end
end


find_all_permutations(@a.length, 2)