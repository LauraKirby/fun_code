unknown_words = ["s","z", "a", "c", "d", "e"]

# def find_rotation_index(word_list)
#   alphabet_start = "a".to_i
#   alphabet_end = "z".to_i


#   midpoint = word_list.length

#   if midpoint < word_list[]


# mlb media
# end


def find_rotation_point(words)

  first_word = words[0]

  floor_index = 0
  ceiling_index = words.length - 1

  while floor_index < ceiling_index

    # guess a point halfway between floor and ceiling
    guess_index = floor_index + ((ceiling_index - floor_index) / 2)
    puts "guess_index #{guess_index}"
    # if guess comes after first word or is the first word
    if words[guess_index] >= first_word
      # go right
      floor_index = guess_index
      puts "floor_index #{floor_index}"
    else
      # go left
      ceiling_index = guess_index
      puts "ceiling_index #{ceiling_index}"
    end

    # if floor and ceiling have converged
    if floor_index + 1 == ceiling_index

      # between floor and ceiling is where we flipped to the beginning
      # so ceiling is alphabetically first
      puts "return #{ceiling_index}"
      return ceiling_index

    end
  end
end




# return value located at rotation point
# use recursion
def binary_search(input)
  midpoint = input.length/2
  mid_minus_one = midpoint - 1

  if input[0] < input[-1] || input.length <= 1
    return input[0]

  elsif input[midpoint] < input[mid_minus_one]
    return input[midpoint]

  # if value at midpoint is less than value at end of array, then the
  # rotation point is on left side
  elsif input[midpoint] < input[-1]
      # call binary_search with left 1/2 of array
      binary_search(input[0..midpoint])

  # rotation point is on right side
  elsif input[midpoint] > input[-1]
    # call binary_search with right 1/2 of array
    binary_search(input[midpoint..-1])
  end

end


input_arr = [5,6,7,10,12,1,2,3,4]
input_arr_2 = [2,1]
input_arr_3 = [1,2,3,4]
# 1
result = binary_search(input_arr)
puts "result #{result}"

result = binary_search(input_arr_2)
puts "result #{result}"

result = binary_search(input_arr_3)
puts "result #{result}"